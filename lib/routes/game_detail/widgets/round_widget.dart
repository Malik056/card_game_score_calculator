import 'package:card_game_calculator/configs/size_config.dart';
import 'package:card_game_calculator/models/round.dart';
import 'package:card_game_calculator/models/round_player.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoundWidget extends StatelessWidget {
  final Round round;

  const RoundWidget({super.key, required this.round});
  @override
  Widget build(BuildContext context) {
    final roundPlayers = List<RoundPlayer>.from(round.roundPlayers);
    roundPlayers.sort((a, b) {
      return a.score.compareTo(b.score);
    });
    final max = roundPlayers.last.score;
    final min = roundPlayers.first.score;

    return Card(
      child: Container(
        padding: EdgeInsets.all(8.0.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Round# ${round.roundNumber + 1}",
              style: Theme.of(context).textTheme.titleMedium,
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 8.w),
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
                for (int i = 0; i < roundPlayers.length; i++)
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
                          child: Text(roundPlayers[i].player.name),
                        ),
                      ),
                      TableCell(
                        child: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.w),
                          child: Text.rich(
                            TextSpan(
                              text: roundPlayers[i].score.toStringAsFixed(2),
                              children: [
                                if (roundPlayers[i].score == min || roundPlayers[i].score == max)
                                  WidgetSpan(
                                    alignment: PlaceholderAlignment.middle,
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                                      child: Icon(
                                        roundPlayers[i].score == min
                                            ? Icons.emoji_events //
                                            : CupertinoIcons.hand_thumbsdown_fill,
                                        color: roundPlayers[i].score == min ? Colors.yellow.shade700 : null,
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
