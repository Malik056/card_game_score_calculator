import 'package:card_game_calculator/services/database_service.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:sqflite/sqflite.dart';

part 'player.g.dart';
part 'player.freezed.dart';

@freezed
class Player with _$Player {
  const Player._();

  const factory Player({
    required final String name,
    required final int id,
  }) = _Player;

  factory Player.fromJson(Map<String, dynamic> json) => _$PlayerFromJson(json);

  static Future<void> createTable(Database db) {
    return db.execute('''
      CREATE TABLE IF NOT EXISTS ${DatabaseService.playersTable} (
        ${PlayerColumns.id} INTEGER PRIMARY KEY,
        ${PlayerColumns.name} TEXT
      );
''');
  }
}
