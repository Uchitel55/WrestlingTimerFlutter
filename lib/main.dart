import 'package:flutter/material.dart';

import 'di/di.dart';
import 'wrestling_timer_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await configureDependencies();
  runApp(const WrestlingTimerApp());
}
