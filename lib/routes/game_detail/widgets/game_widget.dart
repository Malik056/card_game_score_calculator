import 'package:card_game_calculator/configs/size_config.dart';
import 'package:card_game_calculator/models/game.dart';
import 'package:card_game_calculator/models/game_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GameWidget extends StatelessWidget {
  final Game game;

  const GameWidget({super.key, required this.game});
  @override
  Widget build(BuildContext context) {
    final gamePlayers = List<GamePlayer>.from(game.gamePlayers);
    gamePlayers.sort((a, b) {
      return a.score.compareTo(b.score);
    });
    final max = gamePlayers.last.score;
    final min = gamePlayers.first.score;
    final winners = gamePlayers.where((element) => element.score == max).toList();
    final losers = gamePlayers.where((element) => element.score == min).toList();
    return Card(
      child: Container(
        padding: EdgeInsets.all(8.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Game",
              style: Theme.of(context).textTheme.titleLarge,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.w),
            Row(
              children: [
                Text(
                  "ID: ",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  game.id.toString(),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Winner(s): ",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(winners.map((e) => e.player.name).join(",")),
              ],
            ),
            Row(
              children: [
                Text(
                  "Loser(s): ",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(losers.map((e) => e.player.name).join(",")),
              ],
            ),
            Row(
              children: [
                Text(
                  "Date: ",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(
                  DateTime.fromMillisecondsSinceEpoch(game.updatedAt).toIso8601String(),
                ),
              ],
            ),
            Row(
              children: [
                Text(
                  "Status: ",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
                Text(game.status.name),
              ],
            ),
            SizedBox(height: 10.w),
            Table(
              border: TableBorder.all(),
              columnWidths: const {
                0: FlexColumnWidth(3.0),
                1: FlexColumnWidth(2.0),
              },
              children: [
                TableRow(
                  children: [
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.w),
                        child: Text(
                          "Name",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                    TableCell(
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.w),
                        child: Text(
                          "Score",
                          style: Theme.of(context).textTheme.titleSmall,
                        ),
                      ),
                    ),
                  ],
                ),
                for (int i = 0; i < gamePlayers.length; i++)
                  TableRow(
                    decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(),
                      ),
                    ),
                    children: [
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.w),
                          child: Text(gamePlayers[i].player.name),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.w),
                          child: Text.rich(
                            TextSpan(
                              text: gamePlayers[i].score.toStringAsFixed(2),
                              children: [
                                if (gamePlayers[i].score == min || gamePlayers[i].score == max)
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                                      child: Icon(
                                        gamePlayers[i].score == min
                                            ? Icons.emoji_events //
                                            : CupertinoIcons.hand_thumbsdown_fill,
                                        color: gamePlayers[i].score == min ? Colors.yellow.shade700 : null,
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
