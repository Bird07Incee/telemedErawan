import 'dart:convert';
import 'package:convert/convert.dart';
import 'package:data/data.dart';
import 'package:flutter/services.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:hive/hive.dart';

class KeyBuilder {
  static final _prefix = base64.encode('erawan'.codeUnits);
  static final _key = base64.encode("key".codeUnits);
  static const _keyName = "kg";

  static final String _dbName = "${_prefix}_lCCEVvkQPymYUIl4sKVwAMNr";
  static final String _publicKey = "${_prefix}_pMcpBUGeCofji6EehtFuvYsn";

  static const _webDBKeyOptions = WebOptions(dbName: "", publicKey: "");
  static final _aDBKeyOptions = AndroidOptions(sharedPreferencesName: "$_dbName$_key");
  static final _webOptions = WebOptions(dbName: _dbName, publicKey: _publicKey);
  static final _aOptions = AndroidOptions(sharedPreferencesName: _dbName);

  static final _dbKeyStorage = FlutterSecureStorage(webOptions: _webDBKeyOptions ,aOptions: _aDBKeyOptions);
  static final _dbStorage = FlutterSecureStorage(webOptions: _webOptions, aOptions: _aOptions);

  /// Generated DBKey for save SecureKey
  static Future generatedDBKey() async {
    String? kg;
    try {
      kg = await _dbKeyStorage.read(key: _keyName);
      if (kg == null) {
        /// Clean storage and indexedDB all
        await _deletedStorageAll();
      }
    } catch(e) {
      /// When can't readed Key name
      /// Clean storage and indexedDB all
      await _deletedStorageAll();
      kg = null;
    }

    /// Create new key
    if(kg == null){
      final random = Encrypt.random(24);
      final dbKey = hex.encode(utf8.encode(random));
      await _dbKeyStorage.write(key: _keyName, value: dbKey);
    }
  }

  /// Generated SecureKey for save info
  static Future generatedSecureKey() async {
    final dbKey = await _getDBKey();
    String? secureKey;
    try {
      /// read for find secureKey
      secureKey = await _dbStorage.read(key: dbKey!);
    } catch (e) {
      secureKey = null;
    }

    /// Create new secureKey
    if (secureKey == null) {
      final randomKey = Hive.generateSecureKey();
      final secureKey = base64.encode(randomKey);
      await _dbStorage.write(key: dbKey!, value: secureKey);
    }
  }

  static Future<Uint8List> decodeSecureKey() async {
    final secureKey = await _getSecureKey();
    if (secureKey == null) {
      throw ArgumentError.value(secureKey, "decodeSecureKey null");
    }
    return base64.decode(secureKey);
  }

  static Future _deletedStorageAll() async{
    await _dbKeyStorage.deleteAll();
    await _dbStorage.deleteAll();
    await Hive.deleteFromDisk();
  }

  static Future<String?> _getDBKey() {
    return _dbKeyStorage.read(key: _keyName);
  }

  static Future<String?> _getSecureKey() async{
    final dbKey = await _getDBKey();
    return _dbStorage.read(key: dbKey!);
  }

}
