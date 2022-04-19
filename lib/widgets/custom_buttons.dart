import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/timer_cubit.dart';

class TestFile extends StatelessWidget {
  const TestFile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FloatingActionButton _buildFloatingActionButton(
        IconData icon, Function onPressed) {
      return FloatingActionButton(
        child: Icon(icon),
        onPressed: () => onPressed(),
      );
    }

    return BlocBuilder<TimerCubit, TimerState>(
      builder: (context, state) {
        switch (state.status) {
          case TimerStatus.initial:
            return _buildInitial(
              context,
              state,
              _buildFloatingActionButton,
            );

          case TimerStatus.runPause:
            return _buildRunPause(
              context,
              state,
              _buildFloatingActionButton,
            );

          case TimerStatus.runInProgress:
            return _buildRunInProgress(
              context,
              state,
              _buildFloatingActionButton,
            );
          case TimerStatus.runComplete:
            return _buildRunComplete(
              context,
              state,
              _buildFloatingActionButton,
            );
        }
      },
    );
  }

  FloatingActionButton _buildInitial(
    BuildContext context,
    TimerState state,
    FloatingActionButton Function(IconData icon, Function onPressed)
        _buildFloatingActionButton,
  ) {
    return _buildFloatingActionButton(
      Icons.play_arrow,
      () => context.read<TimerCubit>().timerStarted(state.duration),
    );
  }

  Row _buildRunInProgress(
    BuildContext context,
    TimerState state,
    FloatingActionButton Function(IconData icon, Function onPressed)
        _buildFloatingActionButton,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildFloatingActionButton(
          Icons.pause,
          () => context.read<TimerCubit>().timerPaused(state.duration),
        ),
        _buildFloatingActionButton(
          Icons.replay,
          () => context.read<TimerCubit>().timerReset(state.duration),
        ),
      ],
    );
  }

  Row _buildRunPause(
    BuildContext context,
    TimerState state,
    FloatingActionButton Function(IconData icon, Function onPressed)
        _buildFloatingActionButton,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildFloatingActionButton(
          Icons.play_arrow,
          () => context.read<TimerCubit>().timerResumed(state.duration),
        ),
        _buildFloatingActionButton(
          Icons.replay,
          () => context.read<TimerCubit>().timerReset(state.duration),
        ),
      ],
    );
  }

  FloatingActionButton _buildRunComplete(
    BuildContext context,
    TimerState state,
    FloatingActionButton Function(IconData icon, Function onPressed)
        _buildFloatingActionButton,
  ) {
    return _buildFloatingActionButton(
      Icons.play_arrow,
      () => context.read<TimerCubit>().timerPaused(state.duration),
    );
  }
}
