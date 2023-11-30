import 'package:authentication/authentication.dart';
import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telemed Erawan',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.ebony),
        useMaterial3: true,
      ),
      home: const LoginScreen(),
      locale: AppLocales.localeDefault(),
      localizationsDelegates: AppLocales.localizationsDelegates(),
      supportedLocales: AppLocales.supportedLocales(),
    );
  }
}
