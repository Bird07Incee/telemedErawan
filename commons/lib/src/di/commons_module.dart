import 'package:commons/commons.dart';
import 'package:commons/src/storage/key_builder.dart';

Future diCommonModule() async {
  await _initHive();
}

Future<void> _initHive() async {
  await KeyBuilder.generatedDBKey();
  await KeyBuilder.generatedSecureKey();
  await Future.delayed(Duration.zero);
  await HiveHelper.buildDB(dbName: DBNAME.INFO_DB);
  await HiveHelper.buildDB(dbName: DBNAME.IMAGES_DB);
  await Future.delayed(Duration.zero);
}
