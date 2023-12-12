import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:telemed_erawan/app/app.dart';

Future<void> main() async {
  await Hive.initFlutter();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
    DeviceOrientation.portraitDown,
  ]);
  await diCommonModule();
  runApp(const App());
}
