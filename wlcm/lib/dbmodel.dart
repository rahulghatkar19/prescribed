import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  static final _dbName = "Prescribed";
  static final _dbVersion = 1;
  static final _tableName = "Prescription";

  static final id = 'id';
  static final title = 'title';
  static final description = 'description';
  static final howManyDays = 'howManyDays';
  static final howManyTimes = 'howManyTimes';
  static final quantity = 'quantity';
  static final extraNotes = 'extraNotes';

  DatabaseHelper._pvtConstructor();
  static final DatabaseHelper instance = DatabaseHelper._pvtConstructor();

  static Database _database;

  Future<Database> get database async {
    if (_database != null) return _database;

    _database = await _initiateDatabase();

    return _database;
  }

  _initiateDatabase() async {
    Directory directory = await getApplicationDocumentsDirectory();
    String path = join(directory.path, _dbName);
    return await openDatabase(path,
        version: _dbVersion,
        onCreate:
            _createTable); //onCreate :On creating database create a table.
  }

  Future _createTable(Database db, int version) {
    db.execute('''
      CREATE TABLE $_tableName 
      (
      $id INTEGER PRIMARY KEY,
      $title TEXT NOT NULL,
      $description TEXT NOT NULL,
      $howManyDays INTEGER,
      $howManyTimes INTEGER,
      $quantity INTEGER,
      $extraNotes TEXT
      )
      ''');
  }

  Future<int> insert(Map<String, dynamic> row) async {
    Database db = await instance.database;
    return await db.insert(_tableName, row);
  }

  Future<List<Map<String, dynamic>>> select() async{
    Database db = await instance.database;
    return await  db.query(_tableName);
  }

}
