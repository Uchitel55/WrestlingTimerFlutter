part of 'timer_cubit.dart';

enum TimerStatus {
  initial,
  runPause,
  runInProgress,
}

class TimerState extends Equatable {
  final TimerStatus status;
  final int duration;

  const TimerState({
    this.status = TimerStatus.initial,
    this.duration = 180,
  });

  @override
  List<Object> get props => [status, duration];

  TimerState copyWith({
    TimerStatus? status,
    int? duration,
    bool? timerStarted,
  }) {
    return TimerState(
      status: status ?? this.status,
      duration: duration ?? this.duration,
    );
  }
}
