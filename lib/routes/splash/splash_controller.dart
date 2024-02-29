import 'package:card_game_calculator/providers/ads_provider.dart';
import 'package:card_game_calculator/providers/game_provider.dart';
import 'package:card_game_calculator/providers/players_provider.dart';
import 'package:card_game_calculator/routes/main/main_route.dart';
import 'package:card_game_calculator/services/database_service.dart';
import 'package:flutter/material.dart';

class SplashController {
  final DatabaseService _databaseService;
  final GameProvider _gameProvider;
  final AdsProvider _adsProvider;
  final PlayersProvider _playersProvider;
  final NavigatorState _navigatorState;

  SplashController(
    this._databaseService,
    this._gameProvider,
    this._playersProvider,
    this._adsProvider,
    this._navigatorState,
  );

  Future<void> init() async {
    await _databaseService.init();
    await _playersProvider.init();
    await _gameProvider.init();
    await _adsProvider.init();
    _navigatorState.pushReplacementNamed(MainRoute.routeName);
  }
}
