import 'package:flutter/material.dart';
import 'package:telemed_erawan/builder_page.dart';

Widget onBuilder(BuildContext context, Widget? child) {
  return MediaQuery(
    data: MediaQuery.of(context).copyWith(
      textScaler: const TextScaler.linear(1),
    ),
    child: BuilderPage(child: child ?? const SizedBox()),
  );
}
