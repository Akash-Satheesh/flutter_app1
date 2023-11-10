import 'package:flutter_app1/storages/hive%20example/hive%20using%20typeadapter/model/users.dart';
import 'package:hive/hive.dart';

class HiveDB {
  HiveDB._internal();
  static HiveDB instance = HiveDB._internal();
  factory HiveDB() {
    return instance;
  }

  Future<List<Users>> getUsers() async {
    final db = await Hive.openBox<Users>('users');
    return db.values.toList();
  }

  Future<void> addUser(Users user) async {
    final db = await Hive.openBox<Users>('users');
    db.put(user.id, user);
  }
}
