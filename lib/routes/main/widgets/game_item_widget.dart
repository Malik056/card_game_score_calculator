import 'package:card_game_calculator/configs/size_config.dart';
import 'package:card_game_calculator/enums/game_status.dart';
import 'package:card_game_calculator/models/game.dart';
import 'package:flutter/material.dart';

class GameItemWidget extends StatelessWidget {
  final Game game;

  const GameItemWidget({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 10.w, horizontal: 10.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              game.gamePlayers.isEmpty ? "No players" : game.gamePlayers.map((e) => e.player.name).join(", "),
              overflow: TextOverflow.ellipsis,
              maxLines: 1,
            ),
            SizedBox(height: 10.w),
            Text("Last updated: ${DateTime.fromMillisecondsSinceEpoch(game.updatedAt).toIso8601String()}"),
            SizedBox(height: 10.w),
            Text("Total Players: ${game.gamePlayers.length}"),
            SizedBox(height: 10.w),
            Text(
              "Status: ${game.status.name}",
              style: TextStyle(
                color: game.status == GameStatus.inProgress
                    ? Colors.orange
                    : game.status == GameStatus.finished
                        ? Colors.green
                        : null,
              ),
            ),
            if (game.status == GameStatus.finished) SizedBox(height: 10.w),
            if (game.status == GameStatus.finished) Text("Winner(s): ${game.winners.map((e) => e.player.name).join(",")}"),
            if (game.status == GameStatus.finished) SizedBox(height: 10.w),
            if (game.status == GameStatus.finished) Text("Loser(s): ${game.losers.map((e) => e.player.name).join(",")}"),
          ],
        ),
      ),
    );
  }
}
