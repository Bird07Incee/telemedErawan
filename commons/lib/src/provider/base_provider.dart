import 'package:commons/commons.dart';
import 'package:flutter/material.dart';

class BaseProvider extends ChangeNotifier {
  final BuildContext context;

  BaseProvider({required this.context});

  Future<P?> push<P extends Object?>(
    String route, {
    dynamic args,
  }) async {
    return context.push<P>(route, extra: args);
  }

  replaceAll(
    String route, {
    dynamic args,
  }) async {
    return context.replace(route, extra: args);
  }
}
