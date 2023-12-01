
import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:telemed_erawan/routers/router.dart';
import 'package:telemed_erawan/routers/utils.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Telemed Erawan',
      builder: onBuilder,
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.ebony),
        useMaterial3: true,
      ),
      locale: AppLocales.localeDefault(),
      localizationsDelegates: AppLocales.localizationsDelegates(),
      supportedLocales: AppLocales.supportedLocales(),
      routeInformationProvider: AppRouter.router.routeInformationProvider,
      routeInformationParser: AppRouter.router.routeInformationParser,
      routerDelegate: AppRouter.router.routerDelegate,
    );
  }
}
