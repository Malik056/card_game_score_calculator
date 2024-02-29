import 'dart:io';

import 'package:flutter/material.dart';
import 'package:admob_flutter/admob_flutter.dart';

class AdsProvider extends ChangeNotifier {
  AdmobInterstitial? interstitialAd;
  AdmobReward? rewardAd;

  Future<void> init() async {
    Admob.initialize();
    await Admob.requestTrackingAuthorization();
    interstitialAd = AdmobInterstitial(
      adUnitId: getInterstitialAdUnitId()!,
      listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
        if (event == AdmobAdEvent.closed) interstitialAd?.load();
        notifyListeners();
      },
    );

    rewardAd = AdmobReward(
      adUnitId: getRewardBasedVideoAdUnitId()!,
      listener: (AdmobAdEvent event, Map<String, dynamic>? args) {
        if (event == AdmobAdEvent.closed) rewardAd?.load();
        notifyListeners();
      },
    );

    interstitialAd!.load();
    rewardAd!.load();
  }

  /*
  Test Id's from:
  https://developers.google.com/admob/ios/banner
  https://developers.google.com/admob/android/banner

  App Id - See README where these Id's go
  Android: ca-app-pub-3940256099942544~3347511713
  iOS: ca-app-pub-3940256099942544~1458002511

  Banner
  Android: ca-app-pub-3940256099942544/6300978111
  iOS: ca-app-pub-3940256099942544/2934735716

  Interstitial
  Android: ca-app-pub-3940256099942544/1033173712
  iOS: ca-app-pub-3940256099942544/4411468910

  Reward Video
  Android: ca-app-pub-3940256099942544/5224354917
  iOS: ca-app-pub-3940256099942544/1712485313
  */

  String? getBannerAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/2934735716';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/6300978111';
    }
    return null;
  }

  String? getInterstitialAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/4411468910';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/1033173712';
    }
    return null;
  }

  String? getRewardBasedVideoAdUnitId() {
    if (Platform.isIOS) {
      return 'ca-app-pub-3940256099942544/1712485313';
    } else if (Platform.isAndroid) {
      return 'ca-app-pub-3940256099942544/5224354917';
    }
    return null;
  }
}
