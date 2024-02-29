// ignore_for_file: invalid_annotation_target

import 'package:card_game_calculator/models/player.dart';
import 'package:card_game_calculator/services/database_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'game_player.g.dart';
part 'game_player.freezed.dart';

int playerToJson(Player field) {
  return field.id;
}

Player playerFromJson(player) {
  return player;
}

@freezed
class GamePlayer with _$GamePlayer {
  const GamePlayer._();
  @JsonSerializable()
  const factory GamePlayer({
    required final int id,
    @JsonKey(toJson: playerToJson, fromJson: playerFromJson) required final Player player,
    required final double score,
    required final int gameId,
  }) = _GamePlayer;

  factory GamePlayer.fromJson(Map<String, dynamic> json) => _$GamePlayerFromJson(json);

  static Future<void> createTable(Database db) {
    return db.execute('''
      CREATE TABLE IF NOT EXISTS ${DatabaseService.gamePlayersTable} (
        ${GamePlayerColumns.id} INTEGER PRIMARY KEY,
        ${GamePlayerColumns.gameId} INTEGER,
        ${GamePlayerColumns.player} INTEGER,
        ${GamePlayerColumns.score} REAL
      );
''');
  }
}
