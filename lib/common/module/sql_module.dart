import 'package:sqflite/sqflite.dart';

// shared_preferences: ^2.0.11
class SQLModule {
  static SQLModule? _module;
  String? _databaseName;
  Database? _database;

  static SQLModule getInstance() {
    return _module ??= SQLModule();
  }

  Future installDatabase({int? version}) async {
    String s = await getPath();
    _database = await openDatabase(s, version: version ?? 1);
  }

  Database getDatabase() {
    if (_database != null) {
      return _database!;
    }
    throw 'Database is not create';
  }

  Future<void> execute({String? query}) async {
    if (_database != null) {
      await _database?.execute(query ?? '');
      return;
    }
    throw 'Database is not create';
  }

  Future<String> getPath() async {
    String s = await getDatabasesPath();
    return s + (_databaseName ?? '');
  }

  Future<void> close() async {
    if (_database != null) {
      await _database?.close();
      return;
    }
    throw 'Can not find database';
  }

  Future<void> removeDatabase({String? path}) async {
    if (path != null) {
      if (path.isEmpty) {
        await deleteDatabase(path);
        return;
      }
    }
    String mPath = await getPath();
    await deleteDatabase(mPath);
  }

  void setDatabaseName(String databaseName) {
    _databaseName = databaseName;
  }

  String getDatabaseName() {
    if (_databaseName != null) {
      if (_databaseName!.isEmpty) {
        throw 'Cannot find database';
      }
    }
    return (_databaseName ?? '');
  }
}
