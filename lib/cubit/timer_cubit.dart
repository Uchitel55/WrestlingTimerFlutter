import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../model/ticker.dart';

part 'timer_state.dart';

class TimerCubit extends Cubit<TimerState> {
  final Ticker _ticker;

  StreamSubscription<int>? _tickerSubscription;

  TimerCubit(Ticker ticker)
      : _ticker = ticker,
        super(const TimerState());

  @override
  Future<void> close() {
    _tickerSubscription?.cancel();
    return super.close();
  }

  void timerStarted(final int duration) {
    emit(state.copyWith(
      status: TimerStatus.runInProgress,
      duration: state.duration,
    ));
    // _tickerSubscription?.cancel();
    // _tickerSubscription = _ticker
    //     .tick(
    //       ticks: state.duration,
    //     )
    //     .listen(
    //       (duration) => timerTicked(
    //         state.duration,
    //       ),
    //     );
  }

  void timerPaused(final int duration) {
    emit(
      state.copyWith(
        status: TimerStatus.runPause,
        duration: state.duration,
      ),
    );
    // _tickerSubscription?.pause();
  }

  void timerResumed(final int duration) {
    emit(state.copyWith(
      status: TimerStatus.runInProgress,
      duration: state.duration,
    ));
  }

  void timerReset(final int duration) {
    emit(
      state.copyWith(
        status: TimerStatus.initial,
        duration: state.duration,
      ),
    );
  }
}

void timerTicked(final int duration) {}
