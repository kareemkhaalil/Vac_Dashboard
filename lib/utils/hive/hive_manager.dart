import 'package:hive/hive.dart';
import 'package:project_management/utils/hive/hive_box.dart';

class HiveManager {
  static void saveUserId(String userId) {
    HiveBoxes.usersBox.put('userId', userId);
  }

  static String? getUserId() {
    return HiveBoxes.usersBox.get('userId');
  }

  static void saveIsLoggedIn(bool isLoggedIn) {
    HiveBoxes.loggedInBox.put('isLoggedIn', isLoggedIn);
  }

  static bool? getIsLoggedIn() {
    return HiveBoxes.loggedInBox.get('isLoggedIn');
  }

  static void clearHive() {
    HiveBoxes.usersBox.clear();
    HiveBoxes.loggedInBox.clear();
  }
}
