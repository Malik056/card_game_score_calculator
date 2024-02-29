import 'package:card_game_calculator/configs/size_config.dart';
import 'package:card_game_calculator/routes/main/main_route_controller.dart';
import 'package:card_game_calculator/routes/main/widgets/game_item_widget.dart';
import 'package:card_game_calculator/widgets/full_screen_loader.dart';
import 'package:card_game_calculator/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class MainRoute extends StatelessWidget {
  static const routeName = "/game_main_route";

  const MainRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<MainRouteController>(
      create: (context) => MainRouteController(
        context.read(),
        context.read(),
        Navigator.of(context),
      ),
      builder: (context, _) => _MainRouteContent(),
    );
  }
}

class _MainRouteContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Main Page")),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        onPressed: context.read<MainRouteController>().startNewGame,
        label: const Text("New Game"),
      ),
      body: Consumer<MainRouteController>(builder: (context, controller, _) {
        return Screen(
          overlayWidgets: [
            if (controller.loadingMessage != null)
              FullScreenLoader(
                reason: controller.loadingMessage,
              ),
          ],
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                for (int i = 0; i < controller.games.length; i++)
                  Padding(
                    padding: EdgeInsets.only(bottom: 16.0.w, left: 20.w, right: 20.w),
                    child: InkWell(
                      onTap: () => controller.onTapGameItem(controller.games[i]),
                      child: GameItemWidget(
                        game: controller.games[i],
                      ),
                    ),
                  ),
                SizedBox(height: 80.w),
              ],
            ),
          ),
        );
      }),
    );
  }
}
