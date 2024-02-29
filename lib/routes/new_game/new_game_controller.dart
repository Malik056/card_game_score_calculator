// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:autocomplete_textfield/autocomplete_textfield.dart';
import 'package:card_game_calculator/enums/game_status.dart';
import 'package:card_game_calculator/enums/round_status.dart';
import 'package:card_game_calculator/models/player.dart';
import 'package:card_game_calculator/models/round_player.dart';
import 'package:card_game_calculator/providers/ads_provider.dart';
import 'package:card_game_calculator/providers/game_provider.dart';
import 'package:card_game_calculator/providers/players_provider.dart';
import 'package:card_game_calculator/routes/game_detail/game_detail_route.dart';
import 'package:card_game_calculator/utils/utils.dart';
import 'package:change_case/change_case.dart';
import 'package:flutter/material.dart';

import 'package:card_game_calculator/models/game.dart';
import 'package:card_game_calculator/models/game_player.dart';
import 'package:fluttertoast/fluttertoast.dart';

class NewGameController extends ChangeNotifier {
  final GameProvider _gameProvider;
  final PlayersProvider _playersProvider;
  final AdsProvider _adsProvider;
  final NavigatorState _navigatorState;
  Game game;

  NewGameController(
    this.game,
    this._gameProvider,
    this._playersProvider,
    this._adsProvider,
    this._navigatorState,
  ) {
    _adsProvider.addListener(notifyListeners);
    _gameProvider.addListener(notifyListeners);
    if (game.status == GameStatus.inProgress) {
      playerScoreControllers = game.gamePlayers.map((e) => TextEditingController(text: "0.00")).toList();
      for (int i = 0; i <= game.currentRound; i++) {
        roundsFormKeys.add(GlobalKey());
      }
    }
  }

  GlobalKey<AutoCompleteTextFieldState<String>> key = GlobalKey<AutoCompleteTextFieldState<String>>();

  FocusNode addPlayerFocusNode = FocusNode();
  List<GamePlayer> get players => game.gamePlayers;

  List<Player> get allPlayers => _playersProvider.players;
  int get currentRound => game.currentRound;

  final roundsFormKeys = <GlobalKey<FormState>>[];
  var playerScoreControllers = <TextEditingController>[];
  final newPlayerController = TextEditingController(text: "");

  String? loadingMessage;
  Player? selectedPlayer;

  String get getActionString {
    String title;
    switch (game.status) {
      case GameStatus.draft:
        title = "Start";
        break;
      default:
        title = "Submit";
        break;
    }
    return title;
  }

  String get getTitle {
    String title;
    switch (game.status) {
      case GameStatus.draft:
        title = "Add Player";
        break;
      case GameStatus.inProgress:
        title = "Round ${game.currentRound + 1}";

        break;
      case GameStatus.finished:
        title = "Game: ${game.id}";
        break;
    }
    return title;
  }

  @override
  void dispose() {
    _gameProvider.removeListener(notifyListeners);
    _adsProvider.removeListener(notifyListeners);
    super.dispose();
  }

  void itemSubmitted(String player) {
    newPlayerController.text = player;
  }

  void onChangedPlayerName(String text) {
    if (text != selectedPlayer?.name) {
      selectedPlayer = null;
    }
    notifyListeners();
  }

  void addPlayer() async {
    loadingMessage = "Addinng new player";
    notifyListeners();
    final name = newPlayerController.text.toLowerCase();
    if (name.isEmpty) {
      Fluttertoast.showToast(msg: "Name is empty");
      return;
    }
    if (allPlayers.where((element) => element.name.toLowerCase() == name).isNotEmpty) {
      final first = allPlayers.where((element) => element.name.toLowerCase() == name).first;
      if (game.gamePlayers.where((element) => element.player.id == first.id).isNotEmpty) {
        Fluttertoast.showToast(msg: "Player already in game");
        loadingMessage = null;
        notifyListeners();
      } else {
        game = await _gameProvider.addPlayer(
          GamePlayer(
            id: DateTime.now().millisecondsSinceEpoch + game.id,
            player: first,
            score: 0,
            gameId: game.id,
          ),
        );
        loadingMessage = null;
        notifyListeners();
      }
      newPlayerController.text = "";
      key.currentState!.clear();
      return;
    }
    newPlayerController.text = "";
    key.currentState!.clear();
    DateTime now = DateTime.now();
    final gamePlayer = GamePlayer(
      id: now.millisecondsSinceEpoch + game.id,
      gameId: game.id,
      player: Player(name: name.toTitleCase(), id: now.millisecondsSinceEpoch),
      score: 0,
    );

    game = await _gameProvider.addPlayer(gamePlayer);
    key.currentState!.updateSuggestions(allPlayers.map((e) => e.name.toTitleCase()).toList());
    loadingMessage = null;
    notifyListeners();
  }

  void removePlayer(GamePlayer player) async {
    loadingMessage = "Addinng new player";
    notifyListeners();
    game = await _gameProvider.removePlayer(game, player);
    loadingMessage = null;
    notifyListeners();
  }

  void startGame() async {
    loadingMessage = "Creating game";
    notifyListeners();
    game = await _gameProvider.startGame(game);
    playerScoreControllers = game.gamePlayers.map((e) => TextEditingController(text: "0.00")).toList();
    roundsFormKeys.add(GlobalKey());

    loadingMessage = null;
    notifyListeners();
  }

  void nextRound() async {
    final isloaded = await _adsProvider.rewardAd?.isLoaded;
    if(isloaded == false) {
      Fluttertoast.showToast(msg: "Ad is not loaded");
      return;
    }
    _adsProvider.rewardAd?.show();
    if (roundsFormKeys[currentRound].currentState?.validate() ?? false) {
      loadingMessage = "Saving scores";
      notifyListeners();

      var currentRound = game.rounds[game.currentRound];
      currentRound = currentRound.copyWith(
        status: RoundStatus.completed,
        roundPlayers: <RoundPlayer>[
          for (int i = 0; i < currentRound.roundPlayers.length; i++) //
            currentRound.roundPlayers[i].copyWith(score: double.tryParse(playerScoreControllers[i].text) ?? 0),
        ],
        updatedAt: Utils.nowMillis,
      );

      game = await _gameProvider.saveRoundAndStartNextRound(game, currentRound);
      if (game.status == GameStatus.finished) {
        _navigatorState.pushReplacementNamed(
          GameDetailsRoute.routeName,
          arguments: {'game': game},
        );
        return;
      }
      roundsFormKeys.add(GlobalKey());
      playerScoreControllers = game.gamePlayers.map((e) => TextEditingController(text: "0.00")).toList();

      loadingMessage = null;
      notifyListeners();
    }
  }

  void onSubmit() async {
    if (game.status == GameStatus.draft) {
      if (players.length < 2) {
        Fluttertoast.showToast(msg: "Please add at least two players");
      } else {
        startGame();
      }
    } else {
      nextRound();
    }
  }
}
