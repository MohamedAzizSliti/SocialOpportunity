import 'package:sqflite/sqflite.dart';

import 'database_connection.dart';

class Repository {
  late DatabaseConnection _databaseConnection;
  Repository() {
    _databaseConnection = DatabaseConnection();
  }
  static Database? _database;
  Future<Database?> get database async {
    if (_database != null) {
      return _database;
    } else {
      _database = await _databaseConnection.setDatabase();
      return _database;
    }
  }

  insertData(table, data) async {
    var connection = await database;
    return await connection?.insert(table, data);
  }

  readData(table) async {
    var connection = await database;
    return await connection?.query(table);
  }

  readDataById(table, itemId) async {
    var connection = await database;
    return await connection
        ?.query(table, where: 'idopportunity=?', whereArgs: [itemId]);
  }

  updateData(table, data) async {
    var connection = await database;
    return await connection?.update(table, data,
        where: 'idopportunity=?', whereArgs: [data['idopportunity']]);
  }

  deleteDataById(table, itemId) async {
    var connection = await database;
    return await connection
        ?.delete(table, where: "idopportunity = ?", whereArgs: [itemId]);
  }

  deleteAllArticles(table) async {
    var connection = await database;
    return await connection?.delete(table);
  }
}
