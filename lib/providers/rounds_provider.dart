import 'package:card_game_calculator/models/round.dart';
import 'package:card_game_calculator/models/round_player.dart';
import 'package:card_game_calculator/providers/players_provider.dart';
import 'package:card_game_calculator/services/database_service.dart';

class RoundsProvider {
  final DatabaseService _databaseService;
  final PlayersProvider _playersProvider;

  RoundsProvider(this._databaseService, this._playersProvider);

  Future<List<Round>> getRoundsForGame(int gameId) async {
    final results = await _databaseService.getRoundForGame(gameId);
    final List<int> roundIds = results.map((e) => e['id'] as int).toList();
    final roundsPlayersData = await _databaseService.getRoundPlayersForManyRounds(roundIds);
    final roundPlayers = roundsPlayersData.map((e) {
      e['player'] = _playersProvider.playersMap[e['player']];
      return RoundPlayer.fromJson(e);
    }).toList();
    return results.map((e) {
      e['roundPlayers'] = roundPlayers.where((element) => element.roundId == e['id']).toList();
      return Round.fromJson(e);
    }).toList();
  }

  Future<List<Round>> getRoundsForGames(List<int> gameIds) async {
    final results = await _databaseService.getRoundsForManyGames(gameIds);
    final List<int> roundIds = results.map((e) => e['id'] as int).toList();
    final roundsPlayersData = await _databaseService.getRoundPlayersForManyRounds(roundIds);
    final roundPlayers = roundsPlayersData.map((e) {
      e = Map.from(e);
      e['player'] = _playersProvider.playersMap[e['player']];
      return RoundPlayer.fromJson(e);
    }).toList();
    return results.map((e) {
      e = Map.from(e);
      e['roundPlayers'] = roundPlayers.where((element) => element.roundId == e['id']).toList();
      return Round.fromJson(e);
    }).toList();
  }

  Future<void> createRound(Round round) async {
    return _databaseService.createRound(round);
  }
  
  Future<void> updateRound(Round round) async {
    return _databaseService.updateRound(round);
  }
}
