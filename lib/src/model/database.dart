import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseHelper {
  DatabaseHelper._();

  static final DatabaseHelper instance = DatabaseHelper._();

  static Database? _database;

  get database async {
    if (_database != null) return _database;
    return await _initDatabase();
  }

  _initDatabase() async {
    return openDatabase(
      join(await getDatabasesPath(), 'apartamentos.db'),
      onCreate: (db, version) {
        db.execute(
          '''
          create table tenant(
            id integer primary key, 
            name text, 
            number integer, 
            value integer, 
            dateIn text, 
            dateOut text, 
            status text, 
            place integer, 
            phone text
          );
          ''',
        );
      },
      version: 1,
    );
  }
}
