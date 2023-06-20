import 'package:flutter/cupertino.dart';
import 'package:my_bank/common/modules/user.dart';
import 'package:my_bank/services/models/queries.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseService extends ChangeNotifier {
  static final DatabaseService instance = DatabaseService.getInstance();
  DatabaseService.getInstance();
  factory DatabaseService() {
    return instance;
  }

  static Database? _db;

  static Future<Database> get db async {
    if (_db != null) {
      return _db!;
    } else {
      _db = await openDatabase(
        "MyBank.db",
        version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(Queries.creatUsersTableQuery);
        },
      );
      return _db!;
    }
  }

  Future<int> insertUser(User user) async {
    var client = await db;
    return await client.insert("Users", user.toJson());
  }

  Future<bool> updateUser(User user) async {
    var client = await db;
    await client.update(
      "Users",
      user.toJson(),
      where: 'id = ?',
      whereArgs: [user.id],
    );
    return true;
  }

  Future<List<User>> getAllUsers() async {
    var client = await db;
    List<Map<String, dynamic>> usersData = await client.query("Users");
    List<User> users =
        usersData.map((userData) => User.fromJson(userData)).toList();
    return users;
  }

  Future close() async {
    var client = await db;
    await client.close();
  }
}
