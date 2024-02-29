import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:card_game_calculator/configs/size_config.dart';
import 'package:card_game_calculator/enums/game_status.dart';
import 'package:card_game_calculator/models/game.dart';
import 'package:card_game_calculator/routes/new_game/new_game_controller.dart';
import 'package:card_game_calculator/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:quick_input_formatters/formatters/decimal_text_input_formatter.dart';

class NewGameRoute extends StatelessWidget {
  static const String routeName = "/new_game";

  const NewGameRoute({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;

    return ChangeNotifierProvider(
      create: (context) => NewGameController(
        args['game'] as Game,
        context.read(),
        context.read(),
        context.read(),
        Navigator.of(context),
      ),
      builder: (context, _) => _NewGameRouteContent(),
    );
  }
}

class _NewGameRouteContent extends StatelessWidget {
  Widget _buildPlayerInputScreen(NewGameController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Padding(
          padding: EdgeInsets.all(20.w),
          child: Row(
            children: [
              Expanded(
                child: SimpleAutoCompleteTextField(
                  submitOnSuggestionTap: true,
                  suggestionsAmount: 5,
                  clearOnSubmit: false,
                  key: controller.key,
                  focusNode: controller.addPlayerFocusNode,
                  decoration: const InputDecoration(
                    hintText: "Player name",
                  ),
                  controller: controller.newPlayerController,
                  textChanged: controller.onChangedPlayerName,
                  suggestions: controller.allPlayers.map((e) => e.name).toList(),
                  textSubmitted: controller.itemSubmitted,
                ),
              ),
              SizedBox(width: 20.w),
              IconButton(
                onPressed: controller.addPlayer,
                icon: const Icon(Icons.add),
              ),
            ],
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                for (int i = 0; i < controller.players.length; i++) //
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.0.w, vertical: 8.w),
                    child: Row(
                      children: [
                        Text(controller.players[i].player.name),
                        const Spacer(),
                        IconButton(
                          onPressed: () => controller.removePlayer(controller.players[i]),
                          icon: const Icon(Icons.delete),
                        ),
                      ],
                    ),
                  ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.w),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NewGameController>(
      builder: (context, controller, _) {
        return Screen(
          child: Scaffold(
            appBar: AppBar(
              title: Text(
                controller.getTitle,
              ),
              actions: [
                TextButton(
                  onPressed: controller.onSubmit,
                  child: Text(
                    controller.getActionString,
                  ),
                ),
              ],
            ),
            body: controller.game.status == GameStatus.draft //
                ? _buildPlayerInputScreen(controller)
                : controller.game.status == GameStatus.inProgress
                    ? _buildScoreEntry(context)
                    : const SizedBox()
          ),
        );
      },
    );
  }

  Widget _buildScoreEntry(BuildContext context) {
    final controller = context.read<NewGameController>();
    return Form(
      key: controller.roundsFormKeys[controller.game.currentRound],
      child: Column(
        children: [
          for (int i = 0; i < controller.players.length; i++) //
            _buildPlayerScoreTile(context, i),
        ],
      ),
    );
  }

  Widget _buildPlayerScoreTile(BuildContext context, int index) {
    final NewGameController controller = context.read();
    final player = controller.players[index];
    final textController = controller.playerScoreControllers[index];
    return Card(
      margin: EdgeInsets.symmetric(vertical: 10.w, horizontal: 20.w),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 8.w),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(player.player.name),
                  SizedBox(height: 4.w),
                  Text(
                    "Trial by ${player.score.toStringAsFixed(2)}",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
            ),
            SizedBox(width: 20.w),
            SizedBox(
              width: 100.w,
              child: TextFormField(
                controller: textController,
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(7),
                  DecimalTextInputFormatter(2),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
