// ignore_for_file: invalid_annotation_target

import 'package:card_game_calculator/enums/game_status.dart';
import 'package:card_game_calculator/models/game_player.dart';
import 'package:card_game_calculator/models/player.dart';
import 'package:card_game_calculator/models/round.dart';
import 'package:card_game_calculator/services/database_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'game.g.dart';
part 'game.freezed.dart';

int? playerToJson(Player? field) {
  return field?.id;
}

Player? playerFromJson(player) {
  return player;
}

List<GamePlayer> gamePlayersFromJson(palyers) {
  final gamePlayers = (palyers as List<dynamic>).map((e) => e as GamePlayer).toList();
  return gamePlayers;
}

List<Round> roundsFromJson(rounds) {
  final lRounds = (rounds as List<dynamic>).map((e) => e as Round).toList();
  return lRounds;
}

@freezed
class Game with _$Game {
  const Game._();
  @JsonSerializable()
  const factory Game({
    required final int id,
    @JsonKey(includeFromJson: true, includeToJson: false, fromJson: gamePlayersFromJson) //
    @Default([])
    final List<GamePlayer> gamePlayers,
    @JsonKey(includeToJson: false, includeFromJson: true, fromJson: roundsFromJson) //
    @Default([])
    final List<Round> rounds,
    required final GameStatus status,
    required final int currentRound,
    required final int createdAt,
    required final int updatedAt,
  }) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);

  List<GamePlayer> get winners {
    double max = 0;
    final winners = <GamePlayer>[];
    for (int i = 0; i < gamePlayers.length; i++) {
      final player = gamePlayers[i];
      if (player.score > max) {
        max = player.score;
      }
    }

    for (int i = 0; i < gamePlayers.length; i++) {
      final player = gamePlayers[i];
      if (player.score == max) {
        winners.add(player);
      }
    }
    return winners;
  }

  List<GamePlayer> get losers {
    double min = 0;
    final losers = <GamePlayer>[];
    for (int i = 0; i < gamePlayers.length; i++) {
      final player = gamePlayers[i];
      if (player.score <= min) {
        min = player.score;
      }
    }

    for (int i = 0; i < gamePlayers.length; i++) {
      final player = gamePlayers[i];
      if (player.score == min) {
        losers.add(player);
      }
    }
    return losers;
  }

  static Future<void> createTable(Database db) {
    return db.execute('''
      CREATE TABLE IF NOT EXISTS ${DatabaseService.gamesTable}(
        ${GameColumns.id} INTEGER PRIMARY KEY,
        ${GameColumns.status} TEXT,
        ${GameColumns.updatedAt} INTEGER,
        ${GameColumns.createdAt} INTEGER,
        ${GameColumns.currentRound} INTEGER
      );
''');
  }
}
