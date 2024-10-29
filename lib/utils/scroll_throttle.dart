import 'dart:async';
import 'package:flutter/material.dart';

class ThrottledScrollController extends ScrollController {
  Timer? _throttle;
  final Duration throttleDuration;

  ThrottledScrollController({
    this.throttleDuration = const Duration(milliseconds: 100),
  });

  @override
  void notifyListeners() {
    _throttle?.cancel();
    _throttle = Timer(throttleDuration, () {
      super.notifyListeners();
    });
  }

  @override
  void dispose() {
    _throttle?.cancel();
    super.dispose();
  }
}