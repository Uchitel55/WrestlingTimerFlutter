import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

import '../core/base_cubit.dart';

part 'home_page_state.dart';

@injectable
class HomePageCubit extends BaseCubit<HomePageState> {
  HomePageCubit() : super(HomePageState());

  @override
  void handleError(String errorMessage) {
    // TODO: implement handleError
  }
}
