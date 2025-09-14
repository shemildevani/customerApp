import 'dart:io';

import 'package:customer_app/database/database_constant.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class SqfliteDBHelper {
  static final SqfliteDBHelper _instance = SqfliteDBHelper._internal();

  Database? _database;

  factory SqfliteDBHelper() => _instance;

  SqfliteDBHelper._internal();

  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    }
    _database = await initDatabse();
    return _database;
  }

  Future<Database> initDatabse() async {
    Directory dirPath = await getApplicationDocumentsDirectory();

    String dbPath = join(dirPath.path, "HandleStoreData.db");

    return openDatabase(dbPath, version: 1, onCreate: _onCreate);
  }

  Future<void> _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $sqlSavedBusiness(
      id TEXT PRIMARY KEY,
    )''');
    await db.execute('''
    CREATE TABLE $sqlFavouriteBusiness(
      id TEXT PRIMARY KEY,
    )''');
  }

  // Future<void> deleteDatabaseFile() async {
  //   Directory dirPath = await getApplicationDocumentsDirectory();
  //   String dbPath = join(dirPath.path, "HandleStoreData.db");

  //   // Deleting the database
  //   await deleteDatabase(dbPath);
  //   print('1001====>Database deleted successfully.');

  //   // Clear the in-memory reference
  //   _database = null;
  // }

  Future<void> addData({required String tableName, required String id}) async {
    final db = await database;
    await db!.insert(tableName, {'id': id});

    // List<Map<String, dynamic>> result = await db.query(tableName);

    // // Print the saved data
    // print('Data saved to table: $tableName');
    // print('10001==>Saved data: $result');
  }

  Future<void> addMultipleData(String tableName, List<String> ids) async {
    final db = await database;
    Batch batch = db!.batch();

    for (var id in ids) {
      batch.insert(tableName, {
        'id': id,
      }, conflictAlgorithm: ConflictAlgorithm.replace);
    }

    // List<Map<String, dynamic>> result = await db.query(tableName);

    // // Print the saved data
    // print('Data saved to table: $tableName');
    // print('10001==>Saved data: $result');

    await batch.commit();
  }

  Future<void> clearTableData(String tableName) async {
    final db = await database;
    await db!.delete(tableName);
  }

  // Future<List<T>> getConditionDataList<T>({
  //   required String tableName,
  //   String condition = '',
  //   required T Function(Map<String, dynamic>) fromMap,
  // }) async {
  //   final db = await database;
  //   var result =
  //       condition != ''
  //           ? await db!.query(tableName, where: condition)
  //           : await db!.query(tableName);
  //   // List<Map<String, dynamic>> re = await db.query(tableName);

  //   // // Print the saved data
  //   // print('Data saved to table: $tableName');
  //   // print('10001==>Saved data: ${re.length}');
  //   return result.map((map) => fromMap(map)).toList();
  // }

  // Future<T?> getDataById<T>({
  //   required String tableName,
  //   required String coulumnname,
  //   required String compare,
  //   required T Function(Map<String, dynamic>) fromMap,
  // }) async {
  //   final db = await database;
  //   var result = await db!.query(
  //     tableName,
  //     where: '$coulumnname = ?',
  //     whereArgs: [compare],
  //   );

  //   if (result.isNotEmpty) {
  //     return fromMap(result.first);
  //   } else {
  //     return null; // Remedy not found
  //   }
  // }

  // Future<void> executeRawQuery(String query) async {
  //   final db = await database;
  //   try {
  //     await db!.rawUpdate(query);
  //     // ignore: empty_catches
  //   } catch (e) {}
  // }

  // Future<void> deleteRecordsByIds({
  //   required String tableName,
  //   required String idColumn,
  //   required List<String> ids,
  // }) async {
  //   try {
  //     final db = await database;
  //     String idsString = ids.map((id) => "'$id'").join(',');
  //     String query = 'DELETE FROM $tableName WHERE $idColumn IN ($idsString)';
  //     await db!.rawDelete(query);
  //     debugPrint("Deleted records with IDs: $idsString from $tableName");
  //   } catch (e) {
  //     debugPrint("Error deleting records: $e");
  //   }
  // }

  Future<void> removeData({
    required String id,
    required String tableName,
  }) async {
    final db = await database;
    await db!.delete(tableName, where: 'id =?', whereArgs: [id]);
  }

  // Future<void> updateData({
  //   required String tableName,
  //   required dynamic model,
  //   required String columnname,
  // }) async {
  //   try {
  //     final db = await database;
  //     await db!.update(
  //       tableName,
  //       model.toMap(),
  //       where: '$columnname =?',
  //       whereArgs: [model.id],
  //     );
  //     debugPrint('successfull......');
  //   } catch (e) {
  //     debugPrint('error in updating......');
  //   }
  // }
}
