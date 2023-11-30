// ignore_for_file: depend_on_referenced_packages
import 'package:commons/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppLocales {
  static Locale localeDefault() {
    return const Locale("th");
  }

  static Iterable<LocalizationsDelegate<dynamic>>? localizationsDelegates() {
    return [
      S.delegate,
      GlobalMaterialLocalizations.delegate,
      GlobalWidgetsLocalizations.delegate,
      GlobalCupertinoLocalizations.delegate,
    ];
  }

  static List<Locale> supportedLocales() {
    return S.delegate.supportedLocales;
  }
}
