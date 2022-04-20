import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/timer_cubit.dart';

class CustomButtons extends StatelessWidget {
  const CustomButtons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        }
      },
    );
  }

  FloatingActionButton _buildFloatingActionButton(
      IconData icon, Function onPressed) {
    return FloatingActionButton(
      child: Icon(icon),
      onPressed: () => onPressed(),
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
      () => context.read<TimerCubit>().timerStarted(),
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
          () => context.read<TimerCubit>().timerPaused(),
        ),
        _buildFloatingActionButton(
          Icons.replay,
          () => context.read<TimerCubit>().timerReset(),
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
          () => context.read<TimerCubit>().timerResumed(),
        ),
        _buildFloatingActionButton(
          Icons.replay,
          () => context.read<TimerCubit>().timerReset(),
        ),
      ],
    );
  }
}
