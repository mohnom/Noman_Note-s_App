import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class Sqflite {
  static Database? _db;
  Future<Database?> get db async {
    if (_db == null) {
      _db = await intialdb();
      return _db;
    } else {
      return _db;
    }
  }

  intialdb() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'note.db');
    Database? Mydb = await openDatabase(path,
        onCreate: _onCreate, version: 2, onUpgrade: _onUpgrate);
    return Mydb;
  }

  _onCreate(Database db, int version) async {
    await db.execute('''
CREATE TABLE 'NOTE'(
id INTEGER PRIMARY KEY  AUTOINCREMENT,
title TEXT NOT NULL,
Discrebtion TEXT ,
"DATE" TEXT NOT NULL

)

 ''');
 
  }

  _onUpgrate(Database db, int oldversion, int newversion) {
    print(" OnUpgrate    =======");
  }

  readData(String sql) async {
    Database? Mydb = await db;
    List<Map> response = await Mydb!.rawQuery(sql,);
    return response;
  }

  insertData(String sql) async {
    Database? Mydb = await db;
    int response = await Mydb!.rawInsert(sql);
    return response;
  }

  updatData(String sql) async {
    Database? Mydb = await db;
    int response = await Mydb!.rawUpdate(sql);
    return response;
  }

  MydeleteDatabase() async {
    String databasepath = await getDatabasesPath();
    String path = join(databasepath, 'note.db');
    await deleteDatabase(path);
    print("=========deleted");
  }

  DeleteData(String table) async {
    Database? Mydb = await db;
    int response = await Mydb!.rawDelete(table);
    return response;
  }

  read(String table, List<String> column) async {
    Database? Mydb = await db;
    List<Map> response = await Mydb!.query(table);
    return response;
  }

  insert(String table, Map<String, Object> n) async {
    Database? Mydb = await db;
    int response = await Mydb!.insert(table, n);
    print("  =====reer");
    return response;
    
  }

  updat(String sql, Map<String, Object?> values,String? MyWhere) async {
    Database? Mydb = await db;
    int response = await Mydb!.update(sql,values,where: MyWhere);
    return response;
  }

  Data(String sql) async {
    Database? Mydb = await db;
    int response = await Mydb!.rawDelete(sql);
    return response;
  }
}
