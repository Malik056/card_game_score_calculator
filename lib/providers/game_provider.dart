import 'dart:math';

import 'package:card_game_calculator/enums/game_status.dart';
import 'package:card_game_calculator/enums/round_status.dart';
import 'package:card_game_calculator/models/game.dart';
import 'package:card_game_calculator/models/game_player.dart';
import 'package:card_game_calculator/models/round.dart';
import 'package:card_game_calculator/models/round_player.dart';
import 'package:card_game_calculator/providers/players_provider.dart';
import 'package:card_game_calculator/providers/rounds_provider.dart';
import 'package:card_game_calculator/services/database_service.dart';
import 'package:card_game_calculator/utils/utils.dart';
import 'package:flutter/material.dart';

class GameProvider extends ChangeNotifier {
  final DatabaseService _databaseService;
  final RoundsProvider _roundsProvider;
  final PlayersProvider _playersProvider;
  GameProvider(this._databaseService, this._roundsProvider, this._playersProvider);

  List<Game> games = [];

  Future<void> init() async {
    final database = _databaseService.database;
    var results = await database.query(DatabaseService.gamesTable);
    final List<int> gameIds = results.map((e) => e['id'] as int).toList();
    final gamePlayersData = await _databaseService.getGamePlayersForManyGames(gameIds);
    final gamePlayers = gamePlayersData.map((e) {
      e = Map.from(e);
      e[GamePlayerColumns.player] = _playersProvider.playersMap[e[GamePlayerColumns.player]];
      return GamePlayer.fromJson(e);
    }).toList();
    results = results.map((e) {
      e = Map.from(e);
      e['gamePlayers'] = gamePlayers.where((element) => element.gameId == e['id']).toList();
      return e;
    }).toList();

    final rounds = await _roundsProvider.getRoundsForGames(gameIds);

    games = results.map((e) {
      e['rounds'] = rounds.where((element) => element.gameId == e['id']).toList();
      return Game.fromJson(e);
    }).toList();

    notifyListeners();
  }

  Future<Game> newGame() async {
    DateTime now = DateTime.now();
    final currentMillis = now.millisecondsSinceEpoch;
    Game game = Game(
      id: currentMillis,
      status: GameStatus.draft,
      currentRound: 0,
      createdAt: currentMillis,
      updatedAt: currentMillis,
    );

    await _databaseService.createGame(game);
    games.add(game);
    notifyListeners();
    return game;
  }

  Future<Game> addPlayer(GamePlayer player) async {
    final index = games.indexWhere((element) => element.id == player.gameId);
    final game = games[index];
    final nowMillis = DateTime.now().millisecondsSinceEpoch;
    await _playersProvider.addPlayer(player.player);
    try {
      final updatedGame = game.copyWith(
        gamePlayers: [...game.gamePlayers, player],
        updatedAt: nowMillis,
      );
      await _databaseService.updateGame(updatedGame.id, updatedGame);
      games.replaceRange(index, index + 1, [updatedGame]);
      notifyListeners();
      return updatedGame;
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
      return game;
    }
  }

  Future<Game> removePlayer(Game game, GamePlayer player) async {
    final index = games.indexWhere((element) => element.id == game.id);
    final list = List<GamePlayer>.from(game.gamePlayers);
    list.removeWhere((element) => element.id == player.id);
    await _databaseService.removeGamePlayer(player.id);
    final updatedGame = game.copyWith(gamePlayers: list, updatedAt: DateTime.now().millisecondsSinceEpoch);
    await _databaseService.updateGame(game.id, updatedGame);
    games.replaceRange(index, index + 1, [updatedGame]);
    notifyListeners();
    return updatedGame;
  }

  Future<Game> startGame(Game game) async {
    DateTime now = DateTime.now();
    final nowMillis = now.millisecondsSinceEpoch;
    final roundId = nowMillis;
    final Round round = Round(
      id: roundId,
      gameId: game.id,
      roundPlayers: game.gamePlayers
          .map(
            (e) => RoundPlayer(
              id: e.id + roundId,
              player: e.player,
              score: e.score,
              roundId: roundId,
            ),
          )
          .toList(),
      roundNumber: 0,
      status: RoundStatus.created,
      createdAt: nowMillis,
      updatedAt: nowMillis,
    );
    await _roundsProvider.createRound(round);
    final updatedGame = game.copyWith(
      currentRound: 0,
      status: GameStatus.inProgress,
      rounds: [round],
    );
    await _databaseService.updateGame(game.id, updatedGame);
    final index = games.indexWhere((element) => element.id == game.id);
    games.replaceRange(index, index + 1, [updatedGame]);
    notifyListeners();
    return updatedGame;
  }

  Future<Game> saveRoundAndStartNextRound(Game game, Round previousRound) async {
    final minimum = previousRound.roundPlayers.map((e) => e.score).reduce((value, element) => min(value, element));
    final roundPlayers = previousRound.roundPlayers.map((e) {
      if (e.score == minimum) {
        return e.copyWith(score: 0);
      }
      return e;
    }).toList();
    previousRound = previousRound.copyWith(roundPlayers: roundPlayers);

    await _roundsProvider.updateRound(previousRound);
    final rounds = List<Round>.from(game.rounds);
    final index = rounds.indexWhere((element) => element.id == previousRound.id);
    rounds.replaceRange(index, index + 1, [previousRound]);
    final gamePlayers = <GamePlayer>[];
    for (int i = 0; i < game.gamePlayers.length; i++) {
      final roundPlayer = previousRound.roundPlayers[i];

      var gamePlayer = game.gamePlayers[i];
      gamePlayer = gamePlayer.copyWith(
        score: gamePlayer.score + (roundPlayer.score * (game.currentRound < 4 ? 1 : 2)),
      );
      gamePlayers.add(gamePlayer);
    }
    final gameIndex = games.indexWhere((element) => element.id == game.id);
    if (game.currentRound == 4) {
      var updatedGame = game.copyWith(
        rounds: rounds,
        gamePlayers: gamePlayers,
        updatedAt: Utils.nowMillis,
        status: GameStatus.finished,
      );
      await _databaseService.updateGame(updatedGame.id, updatedGame);
      games.replaceRange(gameIndex, gameIndex + 1, [updatedGame]);
      notifyListeners();
      return updatedGame;
    } else {
      final nowMillis = Utils.nowMillis;
      final roundId = nowMillis;
      final Round round = Round(
        id: roundId,
        gameId: game.id,
        roundPlayers: game.gamePlayers
            .map(
              (e) => RoundPlayer(
                id: e.id + roundId,
                player: e.player,
                score: e.score,
                roundId: roundId,
              ),
            )
            .toList(),
        roundNumber: game.currentRound + 1,
        status: RoundStatus.inProgress,
        createdAt: nowMillis,
        updatedAt: nowMillis,
      );
      await _roundsProvider.createRound(round);
      rounds.add(round);
      final updatedGame = game.copyWith(
        gamePlayers: gamePlayers,
        currentRound: game.currentRound + 1,
        rounds: rounds,
      );
      await _databaseService.updateGame(updatedGame.id, updatedGame);
      games.replaceRange(gameIndex, gameIndex + 1, [updatedGame]);
      notifyListeners();
      return updatedGame;
    }
  }
}
