import 'package:card_game_calculator/configs/size_config.dart';
import 'package:card_game_calculator/routes/splash/splash_controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SplashRoute extends StatelessWidget {
  const SplashRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Provider<SplashController>(
      create: (context) => SplashController(
        context.read(),
        context.read(),
        context.read(),
        context.read(),
        Navigator.of(context),
      ),
      builder: (context, _) => _SplashRouteContent(),
    );
  }
}

class _SplashRouteContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<SplashController>(builder: (context, controller, _) {
      WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
        controller.init();
      });
      return Center(
        child: FlutterLogo(
          size: 44.w,
        ),
      );
    });
  }
}
