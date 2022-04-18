import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/timer_bloc.dart';

class ActionButtons extends StatelessWidget {
  const ActionButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FloatingActionButton _buildFloatingActionButton(
        IconData icon, Function onPressed) {
      return FloatingActionButton(
        child: Icon(icon),
        onPressed: () => onPressed(),
      );
    }

    return BlocBuilder<TimerBloc, TimerState>(
      buildWhen: (prev, state) => prev.runtimeType != state.runtimeType,
      builder: (context, state) {
        return _buildTimerStates(
          context,
          state,
          _buildFloatingActionButton,
        );
      },
    );
  }

  Row _buildTimerStates(
    BuildContext context,
    TimerState state,
    FloatingActionButton Function(IconData icon, Function onPressed)
        _buildFloatingActionButton,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        if (state is TimerInitial) ...[
          _buildFloatingActionButton(
            Icons.play_arrow,
            () => context.read<TimerBloc>().add(
                  TimerStarted(duration: state.duration),
                ),
          ),
        ],
        if (state is TimerRunInProgress) ...[
          _buildFloatingActionButton(
            Icons.pause,
            () => context.read<TimerBloc>().add(
                  const TimerPaused(),
                ),
          ),
          _buildFloatingActionButton(
            Icons.replay,
            () => context.read<TimerBloc>().add(
                  const TimerReset(),
                ),
          ),
        ],
        if (state is TimerRunPause) ...[
          _buildFloatingActionButton(
            Icons.play_arrow,
            () => context.read<TimerBloc>().add(
                  const TimerResumed(),
                ),
          ),
          _buildFloatingActionButton(
            Icons.replay,
            () => context.read<TimerBloc>().add(
                  const TimerReset(),
                ),
          ),
        ],
        if (state is TimerRunComplete) ...[
          _buildFloatingActionButton(
            Icons.replay,
            () => context.read<TimerBloc>().add(
                  const TimerReset(),
                ),
          ),
        ]
      ],
    );
  }
}
