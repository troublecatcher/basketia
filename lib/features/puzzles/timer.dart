import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';

final timerProvider = StateNotifierProvider<TimerNotifier, int>((ref) {
  return TimerNotifier();
});

class TimerNotifier extends StateNotifier<int> {
  Timer? _timer;

  TimerNotifier() : super(0);

  void start() {
    nullify();
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      state = state + 1;
    });
  }

  void stop() => _timer?.cancel();

  void nullify() => state = 0;
}
