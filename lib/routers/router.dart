import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:telemed_erawan/routers/screens.dart';

final  key = GlobalKey<NavigatorState>();
class AppRouter {
  static final router = GoRouter(
    initialLocation: Routes.initial,
    redirect: (context, state) async {
      if(state.matchedLocation == Routes.initial){
        return Routes.login;
      }
      return state.matchedLocation;
    },
    routes: [
      GoRoute(
        path: Routes.login,
        pageBuilder: AuthenticationScreen.login,
      ),
      GoRoute(
        path: Routes.ambulanceHome,
        pageBuilder: AmbulanceScreen.home,
      ),
    ],
  );
}
