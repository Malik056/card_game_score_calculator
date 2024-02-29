import 'package:flutter/material.dart';

// its a wrapper class for block builder to show loader on the screen
class Screen extends StatelessWidget {
  final Widget child;
  final List<Widget>? overlayWidgets;
  const Screen({
    super.key,
    required this.child,
    this.overlayWidgets,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Stack(
        fit: StackFit.expand,
        children: [
          child,
          ...overlayWidgets ?? [],
        ],
      ),
    );
  }
}
