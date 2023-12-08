import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:data/data.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class EncryptStorage {
  final _secure = const FlutterSecureStorage(
    aOptions: AndroidOptions(encryptedSharedPreferences: true),
  );

  late final Future<String> _keyGen = _gen();

  Future<String> _gen() async {
    const key = "kg";
    final ketGen = await _secure.read(key: key);

    if (ketGen == null) {
      final gen = Encrypt.random(24);
      final genEncode = hex.encode(utf8.encode(gen));
      await _secure.write(key: key, value: genEncode);
      Hive.deleteFromDisk();
    }

    return (await _secure.read(key: key))!;
  }
}
