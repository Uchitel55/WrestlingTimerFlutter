import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:wrestling_timer/ui/pages/home_page.dart/home_page.dart';
import 'package:wrestling_timer/ui/pages/timer_page.dart/timer_page.dart';

abstract class Routes {
  static const home = '/';
  static const timer = '/timer';
}

Route onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Routes.home:
      return MaterialPageRoute(builder: (_) => HomePage());
    case Routes.timer:
      return PageTransition(
        child: const TimerPage(),
        type: PageTransitionType.fade,
      );
    //TODO: Error Page
    default:
      return MaterialPageRoute(builder: (_) => HomePage());
  }
}
