import 'dart:developer';
import 'package:commons/src/storage/key_builder.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  static Future buildDB({required String dbName}) async {
    try {
      final decodeSecureKey = await KeyBuilder.decodeSecureKey();
      final cipher = HiveAesCipher(decodeSecureKey);

      await Hive.openBox(dbName, encryptionCipher: cipher);
      log('openBox $dbName : ${Hive.isBoxOpen(dbName)}');
    } catch (e) {
      log('openBox error $dbName : $e');

      /// When can't create [dbName]
      if (!Hive.isBoxOpen(dbName)) {
        await Hive.deleteBoxFromDisk(dbName);
        await buildDB(dbName: dbName);
      }
    }
  }

  static Future<void> put<E>(Box box, dynamic key, E value) {
    return box.put(key, value);
  }

  static E? get<E>(Box box, dynamic key, {E? defaultValue}) {
    if (!box.containsKey(key)) {
      return defaultValue;
    }

    return box.get(key, defaultValue: defaultValue);
  }

  static Box<E> box<E>(String dbName) {
    return Hive.box(dbName);
  }

  static Future<int> clearBox(String dbName) {
    if (Hive.isBoxOpen(dbName)) {
      return Hive.box(dbName).clear();
    }
    return Future.value(0);
  }
}
