import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class SizeConfig {
  static double? _width;
  static double? _height;
  static double? _textScaleFactor;
  static double? _heightScaleFactor;
  static bool? _isTablet;
  static bool? _isMobile;

  SizeConfig._();

  static void init([ui.FlutterView? window]) {
    final lWindow = window ?? PlatformDispatcher.instance.views.first;
    final pixelRatio = lWindow.devicePixelRatio;
    _width = lWindow.physicalSize.width / pixelRatio;
    _height = lWindow.physicalSize.height / pixelRatio;

    /// Because the layout is being created w.r.t 384 logical px wide device
    /// Need this to generify width for all screens in mobile
    double referenceWidth = 384.0;

    /// Because the layout is being created w.r.t the height of 838.4 logical px device
    /// Need this to generify height for all screens in mobile
    double referenceHeight = 838.4;

    /// if we are on tablet, then need different reference width
    if (_width! >= 768) {
      _isMobile = false;
      _isTablet = true;

      /// Because the layout is being created w.r.t 1024 logical px wide device
      /// Need this to generify width for all screens in tablet
      referenceWidth = 768;

      /// Because the layout is being created w.r.t the height of 1366 logical px device
      /// Need this to generify height for all screens in tablet
      referenceHeight = 1366;
    } else {
      _isTablet = false;
      _isMobile = true;
    }
    final textScaleFactor = (_width! / referenceWidth);
    if (_isTablet!) {
      _textScaleFactor = textScaleFactor - 0.2;
    } else {
      _textScaleFactor = textScaleFactor;
    }
    _heightScaleFactor = _height! / referenceHeight;
  }

  static double get width {
    if (_width == null) {
      throw Exception("Must call SizeConfig.init() before fetching data from this config");
    }
    return _width!;
  }

  static double get height {
    if (_height == null) {
      throw Exception("Must call SizeConfig.init() before fetching data from this config");
    }
    return _height!;
  }

  static get textScaleFactor {
    if (_textScaleFactor == null) {
      throw Exception("Must call SizeConfig.init() before fetching data from this config");
    }
    return _textScaleFactor;
  }

  static get widthScaleFactor => textScaleFactor;

  static get heightScaleFactor {
    if (_heightScaleFactor == null) {
      throw Exception("Must call SizeConfig.init() before fetching data from this config");
    }
    return _heightScaleFactor;
  }

  static get isTablet {
    if (_isTablet == null) {
      throw Exception("Must call SizeConfig.init() before fetching data from this config");
    }
    return _isTablet;
  }

  static get isMobile {
    if (_isMobile == null) {
      throw Exception("Must call SizeConfig.init() before fetching data from this config");
    }
    return _isMobile;
  }

  static get bottomNavigationHeight => 63.w;

  static MediaQueryData getMediaQuery(MediaQueryData? data, [ui.FlutterView? window]) {
    final basicMediaQuery = data ?? MediaQueryData.fromView(window ?? ui.PlatformDispatcher.instance.views.first);
    return basicMediaQuery.copyWith(
      textScaler: TextScaler.linear(textScaleFactor),
    );
  }

  static double get statusBarHeight => getMediaQuery(null).viewPadding.top;
}

extension SizeExtension on num {
  double get w => (this * SizeConfig.textScaleFactor).toDouble();
  double get h => (this * SizeConfig.heightScaleFactor).toDouble();
}
