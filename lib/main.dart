import 'package:admob_flutter/admob_flutter.dart';
import 'package:card_game_calculator/configs/size_config.dart';
import 'package:card_game_calculator/providers/ads_provider.dart';
import 'package:card_game_calculator/providers/game_provider.dart';
import 'package:card_game_calculator/providers/players_provider.dart';
import 'package:card_game_calculator/providers/rounds_provider.dart';
import 'package:card_game_calculator/routes/game_detail/game_detail_route.dart';
import 'package:card_game_calculator/routes/main/main_route.dart';
import 'package:card_game_calculator/routes/new_game/new_game_route.dart';
import 'package:card_game_calculator/routes/splash/splash_route.dart';
import 'package:card_game_calculator/services/database_service.dart';
import 'package:card_game_calculator/widgets/full_screen_loader.dart';
import 'package:card_game_calculator/widgets/screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_network_connectivity/flutter_network_connectivity.dart';
import 'package:provider/provider.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SizeConfig.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    FlutterNetworkConnectivity flutterNetworkConnectivity = FlutterNetworkConnectivity(
      isContinousLookUp: true, // optional, false if you dont want continous lookup
      lookUpDuration: const Duration(seconds: 5), // optional, to override default lookup duration
    );
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => AdsProvider()),
        Provider(create: (context) => DatabaseService()),
        Provider(create: (context) => PlayersProvider(context.read())),
        Provider(create: (context) => RoundsProvider(context.read(), context.read())),
        ChangeNotifierProvider(
          create: (context) => GameProvider(
            context.read(),
            context.read(),
            context.read(),
          ),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          cardTheme: const CardTheme(margin: EdgeInsets.zero),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        builder: (context, child) {
          return MediaQuery(
            data: SizeConfig.getMediaQuery(MediaQuery.of(context)),
            child: StreamBuilder<bool>(
                stream: flutterNetworkConnectivity.getInternetAvailabilityStream(),
                builder: (context, snapshot) {
                  return Screen(
                    overlayWidgets: [
                      if (snapshot.data == false) //
                        FullScreenLoader(
                          progressIndicator: Icon(
                            Icons.warning,
                            color: Colors.red,
                            size: 48.w,
                          ),
                          reason: "No longer connected",
                        ),
                    ],
                    child: Column(
                      children: [
                        AdmobBanner(
                          adUnitId: context.read<AdsProvider>().getBannerAdUnitId()!,
                          adSize: AdmobBannerSize.FULL_BANNER,
                        ),
                        Expanded(
                          child: child!,
                        ),
                        AdmobBanner(
                          adUnitId: context.read<AdsProvider>().getBannerAdUnitId()!,
                          adSize: AdmobBannerSize.FULL_BANNER,
                        ),
                      ],
                    ),
                  );
                }),
          );
        },
        routes: {
          '/': (context) => const SplashRoute(),
          MainRoute.routeName: (context) => const MainRoute(),
          NewGameRoute.routeName: (context) => const NewGameRoute(),
          GameDetailsRoute.routeName: (context) => const GameDetailsRoute(),
        },
      ),
    );
  }
}
