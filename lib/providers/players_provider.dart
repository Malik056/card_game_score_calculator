import 'package:card_game_calculator/models/player.dart';
import 'package:card_game_calculator/services/database_service.dart';
import 'package:flutter/foundation.dart';

class PlayersProvider {
  final DatabaseService _databaseService;

  PlayersProvider(this._databaseService);

  List<Player> players = [];
  Map<int, Player> playersMap = {};

  Future<void> init() async {
    final results = await _databaseService.getPlayers();
    players = results.map((e) => Player.fromJson(e)).toList();
    for (int i = 0; i < players.length; i++) {
      playersMap.putIfAbsent(players[i].id, () => players[i]);
    }
  }

  Future<void> addPlayer(Player player) async {
    final database = _databaseService.database;
    try {
      await database.insert(DatabaseService.playersTable, player.toJson());
      players.add(player);
      playersMap.putIfAbsent(player.id, () => player);
    } catch (e, s) {
      debugPrint(e.toString());
      debugPrintStack(stackTrace: s);
    }
  }
}
