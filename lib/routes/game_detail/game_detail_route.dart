import 'package:card_game_calculator/configs/size_config.dart';
import 'package:card_game_calculator/models/game.dart';
import 'package:card_game_calculator/providers/ads_provider.dart';
import 'package:card_game_calculator/routes/game_detail/widgets/game_widget.dart';
import 'package:card_game_calculator/routes/game_detail/widgets/round_widget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class GameDetailsRoute extends StatelessWidget {
  static const routeName = "/game_details";
  const GameDetailsRoute({super.key});

  @override
  Widget build(BuildContext context) {
    Game game = (ModalRoute.of(context)!.settings.arguments as Map)['game'];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final adsProvider = context.read<AdsProvider>();
      adsProvider.rewardAd?.show();
    });
    return Scaffold(
      appBar: AppBar(
        title: const Text("Game"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(20.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              GameWidget(game: game),
              SizedBox(height: 10.w),
              for (int i = 0; i < game.rounds.length; i++) //
                Padding(
                  padding: EdgeInsets.only(top: 8.0.w),
                  child: RoundWidget(round: game.rounds[i]),
                ),
              SizedBox(
                height: 20.w,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
