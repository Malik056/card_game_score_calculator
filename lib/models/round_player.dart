// ignore_for_file: invalid_annotation_target

import 'package:card_game_calculator/models/player.dart';
import 'package:card_game_calculator/services/database_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'round_player.g.dart';
part 'round_player.freezed.dart';

int playerToJson(Player field) {
  return field.id;
}

Player playerFromJson(player) {
  return player;
}

@freezed
class RoundPlayer with _$RoundPlayer {
  const RoundPlayer._();
  @JsonSerializable()
  const factory RoundPlayer({
    required final int id,
    @JsonKey(toJson: playerToJson, fromJson: playerFromJson) required final Player player,
    required final double score,
    required final int roundId,
  }) = _RoundPlayer;

  factory RoundPlayer.fromJson(Map<String, dynamic> json) => _$RoundPlayerFromJson(json);
  
  static Future<void> createTable(Database db) {
    return db.execute('''
      CREATE TABLE IF NOT EXISTS ${DatabaseService.roundPlayersTable} (
        ${RoundPlayerColumns.id} INTEGER PRIMARY KEY,
        ${RoundPlayerColumns.roundId} INTEGER,
        ${RoundPlayerColumns.player} INTEGER,
        ${RoundPlayerColumns.score} REAL
      );
''');
  }
}
