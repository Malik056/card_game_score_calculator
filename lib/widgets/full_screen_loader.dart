import 'dart:ui' as ui;
import 'package:card_game_calculator/configs/size_config.dart';
import 'package:flutter/material.dart';

// Custom loader which makes screen blur witha  circular progress indicator
// in the middle as a loader on full screen to block UI.
class FullScreenLoader extends StatelessWidget {
  final bool loading;
  final String? reason;
  final Widget? progressIndicator;
  const FullScreenLoader({
    super.key,
    this.loading = true,
    this.reason,
    this.progressIndicator,
  });

  @override
  Widget build(BuildContext context) {
    if (!loading) {
      return const SizedBox();
    }
    return Material(
      color: Colors.transparent,
      child: BackdropFilter(
        filter: ui.ImageFilter.blur(sigmaX: 2.0, sigmaY: 2.0),
        child: GestureDetector(
          behavior: HitTestBehavior.opaque,
          child: SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Center(
              child: Container(
                padding: EdgeInsets.all(40.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(24.w),
                  color: reason == null ? null : Colors.white,
                ),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    progressIndicator ?? const CircularProgressIndicator(),
                    SizedBox(height: 20.w),
                    if (reason != null)
                      Text(
                        reason!,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
