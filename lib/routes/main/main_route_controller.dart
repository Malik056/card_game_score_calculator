import 'package:card_game_calculator/enums/game_status.dart';
import 'package:card_game_calculator/models/game.dart';
import 'package:card_game_calculator/providers/ads_provider.dart';
import 'package:card_game_calculator/providers/game_provider.dart';
import 'package:card_game_calculator/routes/game_detail/game_detail_route.dart';
import 'package:card_game_calculator/routes/new_game/new_game_route.dart';
import 'package:flutter/material.dart';

class MainRouteController extends ChangeNotifier {
  final GameProvider _gameProvider;
  final AdsProvider _adsProvider;
  final NavigatorState _navigatorState;

  MainRouteController(
    this._gameProvider,
    this._adsProvider,
    this._navigatorState,
  ) {
    loadingMessage = "Loading Ad";
    notifyListeners();
    _adsProvider.rewardAd?.isLoaded.then((loaded) {
      if (loaded == true) {
        startAdShown = true;
        _adsProvider.rewardAd?.show();
        loadingMessage = null;
        notifyListeners();
      }
      _gameProvider.addListener(notifyListeners);
      _adsProvider.addListener(onAdsProviderUpdate);
    });
  }

  void onAdsProviderUpdate() async {
    if ((await _adsProvider.rewardAd?.isLoaded) == true && !startAdShown) {
      startAdShown = true;
      loadingMessage = null;
      _adsProvider.rewardAd?.show();
      notifyListeners();
    }
  }

  bool startAdShown = false;

  List<Game> get games => _gameProvider.games;

  String? loadingMessage;

  Future<void> startNewGame() async {
    loadingMessage = "Creating new game";
    notifyListeners();

    final game = await _gameProvider.newGame();
    _navigatorState.pushNamed(NewGameRoute.routeName, arguments: <String, dynamic>{'game': game});

    loadingMessage = null;
    notifyListeners();
  }

  void onTapGameItem(Game game) async {
    if (game.status != GameStatus.finished) {
      _navigatorState.pushNamed(NewGameRoute.routeName, arguments: <String, dynamic>{'game': game});
    } else {
      _navigatorState.pushNamed(GameDetailsRoute.routeName, arguments: <String, dynamic>{'game': game});
    }
  }

  @override
  void dispose() {
    _gameProvider.removeListener(notifyListeners);
    _adsProvider.removeListener(notifyListeners);
    super.dispose();
  }
}
