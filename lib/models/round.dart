// ignore_for_file: invalid_annotation_target

import 'package:card_game_calculator/enums/round_status.dart';
import 'package:card_game_calculator/models/round_player.dart';
import 'package:card_game_calculator/services/database_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'round.freezed.dart';
part 'round.g.dart';

List<RoundPlayer> roundPlayersFromJson(players) {
  final roundPlayers = (players as List<dynamic>).map((e) => e as RoundPlayer).toList();
  return roundPlayers;
}

@freezed
class Round with _$Round {
  const Round._();
  @JsonSerializable()
  const factory Round({
    required final int id,
    required final int gameId,
    @JsonKey(includeFromJson: true, includeToJson: false, fromJson: roundPlayersFromJson) //
    required final List<RoundPlayer> roundPlayers,
    required int roundNumber,
    required RoundStatus status,
    required int createdAt,
    required int updatedAt,
  }) = _Round;

  factory Round.fromJson(Map<String, dynamic> json) => _$RoundFromJson(json);

  static Future<void> createTable(Database db) {
    return db.execute('''
      CREATE TABLE IF NOT EXISTS ${DatabaseService.roundsTable} (
        ${RoundColumns.id} INTEGER PRIMARY KEY,
        ${RoundColumns.gameId} INTEGER,
        ${RoundColumns.status} TEXT,
        ${RoundColumns.roundNumber} INTEGER,
        ${RoundColumns.createdAt} INTEGER,
        ${RoundColumns.updatedAt} INTEGER
      );
''');
  }
}
