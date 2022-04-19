part of 'timer_cubit.dart';

enum TimerStatus {
  initial,
  runPause,
  runInProgress,
  runComplete,
}

class TimerState extends Equatable {
  final TimerStatus status;
  final int duration;

  const TimerState({
    this.status = TimerStatus.initial,
    this.duration = 80,
  });

  @override
  List<Object> get props => [status, duration];

  TimerState copyWith({
    TimerStatus? status,
    int? duration,
  }) {
    return TimerState(
      status: status ?? this.status,
      duration: duration ?? this.duration,
    );
  }
}
