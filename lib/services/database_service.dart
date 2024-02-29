import 'package:card_game_calculator/models/game.dart';
import 'package:card_game_calculator/models/game_player.dart';
import 'package:card_game_calculator/models/player.dart';
import 'package:card_game_calculator/models/round.dart';
import 'package:card_game_calculator/models/round_player.dart';
import 'package:flutter/foundation.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseException {
  final String message;

  DatabaseException({required this.message});

  @override
  String toString() {
    return message;
  }
}

class GameColumns {
  static const String id = "id";
  static const String status = "status";
  static const String currentRound = "currentRound";
  static const String createdAt = "createdAt";
  static const String updatedAt = "updatedAt";

  static const List<String> colums = [id, status, currentRound, createdAt, updatedAt];
}

class GamePlayerColumns {
  static const String id = "id";
  static const String gameId = "gameId";
  static const String score = "score";
  static const String player = "player";

  static const List<String> columns = [id, gameId, score, player];
}

class RoundPlayerColumns {
  static const String id = "id";
  static const String roundId = "roundId";
  static const String score = "score";
  static const String player = "player";

  static const List<String> columns = [id, roundId, score, player];
}

class PlayerColumns {
  static const String id = "id";
  static const String name = "name";

  static const List<String> columns = [id, name];
}

class RoundColumns {
  static const String id = "id";
  static const String gameId = "gameId";
  static const String roundNumber = "roundNumber";
  static const String status = "status";
  static const String createdAt = "createdAt";
  static const String updatedAt = "updatedAt";

  static const List<String> columns = [id, gameId, roundNumber, status, createdAt, updatedAt];
}

class DatabaseService {
  Database? _database;

  static const playersTable = "players";
  static const gamesTable = "games";
  static const roundPlayersTable = "roundPlayers";
  static const gamePlayersTable = "gamePlayers";
  static const roundsTable = "rounds";

  Database get database {
    if (_database == null) {
      throw DatabaseException(
        message: "Database is not initialized. Please call DatabaseService::init before using any of its method",
      );
    }
    return _database!;
  }

  Future<void> init() async {
    var databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'demo.db');

    _database = await openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async {
        // When creating the db, create the table
        await Player.createTable(db);
        await RoundPlayer.createTable(db);
        await Round.createTable(db);
        await GamePlayer.createTable(db);
        await Game.createTable(db);
      },
    );
    // final db = _database!.database;
    // await db.delete(playersTable);
    // await db.delete(gamesTable);
    // await db.delete(roundsTable);
    // await db.delete(gamePlayersTable);
    // await db.delete(roundPlayersTable);
    // await Player.createTable(db);
    // await RoundPlayer.createTable(db);
    // await Round.createTable(db);
    // await GamePlayer.createTable(db);
    // await Game.createTable(db);
  }

  Future<List<Map<String, Object?>>> getPlayers() {
    return database.query(DatabaseService.playersTable);
  }

  Future<List<Map<String, Object?>>> getGamePlayers() {
    return database.query(DatabaseService.gamePlayersTable);
  }

  Future<List<Map<String, Object?>>> getRoundPlayers(int roundId) {
    return database.query(DatabaseService.roundPlayersTable, where: "${RoundPlayerColumns.roundId}=?", whereArgs: [roundId]);
  }

  Future<List<Map<String, Object?>>> getRoundForGame(int gameId) {
    return database.query(DatabaseService.roundsTable, where: "${RoundColumns.gameId} = ?", whereArgs: [gameId]);
  }

  Future<List<Map<String, Object?>>> getRoundPlayersForManyRounds(List<int> roundIds) {
    return database.query(DatabaseService.roundPlayersTable, where: "${RoundPlayerColumns.roundId} IN (${roundIds.join(",")})", orderBy: "${RoundPlayerColumns.roundId} ASC");
  }

  Future<List<Map<String, Object?>>> getGamePlayersForManyGames(List<int> gameIds) {
    return database.query(DatabaseService.gamePlayersTable, where: "${GamePlayerColumns.gameId} IN (${gameIds.join(",")})", orderBy: "${GamePlayerColumns.gameId} ASC");
  }

  Future<List<Map<String, Object?>>> getRoundsForManyGames(List<int> gameIds) {
    return database.query(DatabaseService.roundsTable, where: "${RoundColumns.gameId} IN (${gameIds.join(",")})", orderBy: "${RoundColumns.gameId} ASC");
  }

  Future<void> updateGame(int id, Game game) async {
    final batch = database.batch();
    for (int i = 0; i < game.gamePlayers.length; i++) {
      batch.insert(
        gamePlayersTable,
        game.gamePlayers[i].toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }
    batch.update(gamesTable, game.toJson(), where: "${GameColumns.id} = ?", whereArgs: [id]);
    final results = await batch.commit();
    debugPrint("Updated game with id: ${results.last}");
  }

  Future<void> removeGamePlayer(int playerId) async {
    final count = database.delete(gamePlayersTable, where: "${GamePlayerColumns.id} = ?", whereArgs: [playerId]);
    debugPrint("Deleted $count players");
  }

  Future<void> createRound(Round round) async {
    final batch = database.batch();

    for (int i = 0; i < round.roundPlayers.length; i++) {
      batch.insert(roundPlayersTable, round.roundPlayers[i].toJson());
    }
    batch.insert(roundsTable, round.toJson());
    final results = await batch.commit();
    debugPrint("Insert ${results.last} Round(s)");
  }

  Future<void> updateRound(Round round) async {
    final batch = database.batch();
    for (int i = 0; i < round.roundPlayers.length; i++) {
      batch.update(
        roundPlayersTable,
        round.roundPlayers[i].toJson(),
        where: "${RoundPlayerColumns.id} = ?",
        whereArgs: [round.roundPlayers[i].id],
      );
    }
    batch.update(roundsTable, round.toJson(), where: "${RoundColumns.id} = ?", whereArgs: [round.id]);
    final results = await batch.commit();
    debugPrint("Updated round with id: ${results.last}");
  }

  Future<void> createGame(Game game) async {
    final count = database.insert(DatabaseService.gamesTable, game.toJson());
    debugPrint("Insert $count Game(s)");
  }
}
