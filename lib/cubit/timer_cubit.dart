import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../utils/ticker.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  StreamSubscription<int>? _tickerSubscription;

  TimerCubit() : super(const TimerState());

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void timerStarted() {
    _tickerSubscription?.cancel();

    _tickerSubscription = tick(
      ticks: state.duration,
    ).listen((duration) => duration > 0
        ? emit(state.copyWith(
            status: TimerStatus.runInProgress, duration: duration))
        : emit(state.copyWith(status: TimerStatus.initial, duration: 180)));
  }

  void timerPaused() {
    _tickerSubscription?.pause();
    emit(
      state.copyWith(
        status: TimerStatus.runPause,
        duration: state.duration,
      ),
    );
  }

  void timerResumed() {
    _tickerSubscription?.resume();
    emit(state.copyWith(
      status: TimerStatus.runInProgress,
      duration: state.duration,
    ));
  }

  void timerReset() {
    _tickerSubscription?.cancel();
    emit(
      state.copyWith(
        status: TimerStatus.initial,
        duration: 180,
      ),
    );
  }
}
