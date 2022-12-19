// ignore_for_file: depend_on_referenced_packages

import 'package:odev_test/data/models/post_model.dart';
import 'package:odev_test/data/preferences/prefs_user.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class MyDatabase {
  static final MyDatabase instance = MyDatabase._init();

  static Database? _database;

  MyDatabase._init();

  final String tablaSQL1 = 'tabla';
  final String tablaSQL2 = 'comments';

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDB('odevtest.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _onCreateDB);
  }

  Future _onCreateDB(Database db, int version) async {
    await db.execute('''
    CREATE TABLE $tablaSQL1(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    date TEXT,
    text TEXT,
    likes INTEGER,
    shares INTEGER,
    comments INTEGER
  )
    ''');

    await db.execute('''
  CREATE TABLE $tablaSQL2(
    comid INTEGER PRIMARY KEY AUTOINCREMENT,
    linkid INTEGER,
    name TEXT,
    date TEXT,
    text TEXT,
    likes INTEGER
  )
    ''');
  }

  Future<void> insert(Post item) async {
    final db = await instance.database;
    await db.insert(tablaSQL1, item.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }

  Future<List<Post>> getAll() async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps =
        await db.query(tablaSQL1, orderBy: "id DESC");
    return List.generate(
      maps.length,
      (i) => Post(
        id: maps[i]['id'],
        name: maps[i]['name'],
        date: maps[i]['date'],
        text: maps[i]['text'],
        likes: maps[i]['likes'],
        shares: maps[i]['shares'],
        comments: maps[i]['comments'],
      ),
    );
  }

  Future<List<Post>> getAllbyName() async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.query(tablaSQL1,
        where: "name = ?", whereArgs: [PrefsUser.name], orderBy: "id DESC");
    return List.generate(
      maps.length,
      (i) => Post(
        id: maps[i]['id'],
        name: maps[i]['name'],
        date: maps[i]['date'],
        text: maps[i]['text'],
        likes: maps[i]['likes'],
        shares: maps[i]['shares'],
        comments: maps[i]['comments'],
      ),
    );
  }

  Future<Post> getByIndex(index) async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps =
        await db.query(tablaSQL1, orderBy: "id");
    var list = List.generate(
      maps.length,
      (i) => Post(
        id: maps[i]['id'],
        name: maps[i]['name'],
        date: maps[i]['date'],
        text: maps[i]['text'],
        likes: maps[i]['likes'],
        shares: maps[i]['shares'],
        comments: maps[i]['comments'],
      ),
    );
    return list.elementAt(index);
  }

  Future<int> deleteAll() async {
    final db = await instance.database;
    return await db.delete(tablaSQL1, where: null, whereArgs: null);
  }

  Future<int> deleteById(int id) async {
    final db = await instance.database;
    return await db.delete(tablaSQL1, where: 'id = ?', whereArgs: [id]);
  }

  Future<int> update(Post item) async {
    final db = await instance.database;
    return await db.update(tablaSQL1, item.toJson(),
        where: 'id = ?', whereArgs: [item.id]);
  }

  //COMMENTS
  Future<List<Comment>> getCommentsbyName(int id) async {
    final db = await instance.database;

    final List<Map<String, dynamic>> maps = await db.query(tablaSQL2,
        where: "linkid = ?", whereArgs: [id], orderBy: "comid DESC");
    return List.generate(
      maps.length,
      (i) => Comment(
        linkid: maps[i]['linkid'],
        comid: maps[i]['comid'],
        name: maps[i]['name'],
        date: maps[i]['date'],
        text: maps[i]['text'],
        likes: maps[i]['likes'],
      ),
    );
  }

  Future<void> insertComment(Comment item) async {
    final db = await instance.database;
    await db.insert(tablaSQL2, item.toJson(),
        conflictAlgorithm: ConflictAlgorithm.replace);
  }
}
