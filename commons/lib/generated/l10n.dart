// GENERATED CODE - DO NOT MODIFY BY HAND
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'intl/messages_all.dart';

// **************************************************************************
// Generator: Flutter Intl IDE plugin
// Made by Localizely
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, lines_longer_than_80_chars
// ignore_for_file: join_return_with_assignment, prefer_final_in_for_each
// ignore_for_file: avoid_redundant_argument_values, avoid_escaping_inner_quotes

class S {
  S();

  static S? _current;

  static S get current {
    assert(_current != null,
        'No instance of S was loaded. Try to initialize the S delegate before accessing S.current.');
    return _current!;
  }

  static const AppLocalizationDelegate delegate = AppLocalizationDelegate();

  static Future<S> load(Locale locale) {
    final name = (locale.countryCode?.isEmpty ?? false)
        ? locale.languageCode
        : locale.toString();
    final localeName = Intl.canonicalizedLocale(name);
    return initializeMessages(localeName).then((_) {
      Intl.defaultLocale = localeName;
      final instance = S();
      S._current = instance;

      return instance;
    });
  }

  static S of(BuildContext context) {
    final instance = S.maybeOf(context);
    assert(instance != null,
        'No instance of S present in the widget tree. Did you add S.delegate in localizationsDelegates?');
    return instance!;
  }

  static S? maybeOf(BuildContext context) {
    return Localizations.of<S>(context, S);
  }

  /// `ยินดีต้อนรับ`
  String get common_welcome {
    return Intl.message(
      'ยินดีต้อนรับ',
      name: 'common_welcome',
      desc: '',
      args: [],
    );
  }

  /// `กรอกรหัสผ่านเพื่อเข้าสู่ระบบ BangkokEMS`
  String get login_sub_title {
    return Intl.message(
      'กรอกรหัสผ่านเพื่อเข้าสู่ระบบ BangkokEMS',
      name: 'login_sub_title',
      desc: '',
      args: [],
    );
  }

  /// `ชื่อผู้ใช้งาน`
  String get login_username {
    return Intl.message(
      'ชื่อผู้ใช้งาน',
      name: 'login_username',
      desc: '',
      args: [],
    );
  }

  /// `รหัสผ่าน `
  String get login_password {
    return Intl.message(
      'รหัสผ่าน ',
      name: 'login_password',
      desc: '',
      args: [],
    );
  }

  /// `ลืมรหัสผ่าน ?`
  String get login_forgot_password {
    return Intl.message(
      'ลืมรหัสผ่าน ?',
      name: 'login_forgot_password',
      desc: '',
      args: [],
    );
  }

  /// `เข้าสู่ระบบ`
  String get login_submit {
    return Intl.message(
      'เข้าสู่ระบบ',
      name: 'login_submit',
      desc: '',
      args: [],
    );
  }

  /// ``
  String get empty {
    return Intl.message(
      '',
      name: 'empty',
      desc: '',
      args: [],
    );
  }
}

class AppLocalizationDelegate extends LocalizationsDelegate<S> {
  const AppLocalizationDelegate();

  List<Locale> get supportedLocales {
    return const <Locale>[
      Locale.fromSubtags(languageCode: 'th'),
    ];
  }

  @override
  bool isSupported(Locale locale) => _isSupported(locale);
  @override
  Future<S> load(Locale locale) => S.load(locale);
  @override
  bool shouldReload(AppLocalizationDelegate old) => false;

  bool _isSupported(Locale locale) {
    for (var supportedLocale in supportedLocales) {
      if (supportedLocale.languageCode == locale.languageCode) {
        return true;
      }
    }
    return false;
  }
}
