import 'package:hive/hive.dart';

class HiveBoxes {
  static Box<String> get usersBox => Hive.box<String>('users');
  static Box<bool> get loggedInBox => Hive.box<bool>('loggedIn');
}
