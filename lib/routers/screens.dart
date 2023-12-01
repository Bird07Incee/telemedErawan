import 'package:ambulance/ambulance.dart';
import 'package:authentication/authentication.dart';
import 'package:commons/commons.dart';
import 'package:flutter/material.dart';
import 'package:telemed_erawan/routers/extensions.dart';

class AuthenticationScreen {
  static Page login(BuildContext context, GoRouterState state) {
    return const LoginScreen().page();
  }
}

class AmbulanceScreen {
  static Page home(BuildContext context, GoRouterState state) {
    return const AmbulanceHomeScreen().page();
  }
}
