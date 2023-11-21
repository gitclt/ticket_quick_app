import 'package:flutter/material.dart';

class MyAnimationController {
  late AnimationController _controller;
  late Animation<double>? _scaleAnimation;

  MyAnimationController(TickerProvider vsync) {
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: vsync,
    );

    _scaleAnimation =
        CurvedAnimation(parent: _controller, curve: Curves.elasticInOut);

    _controller.forward();
  }

  AnimationController get controller => _controller;
  Animation<double>? get scaleAnimation => _scaleAnimation;

  void dispose() {
    _controller.dispose();
  }
}
