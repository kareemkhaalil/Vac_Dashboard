import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_management/services/database_service.dart';

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final DatabaseService _database = DatabaseService();

  // تسجيل الدخول
  Future<User?> signIn(String email, String password) async {
    try {
      final UserCredential userCredential =
          await _auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      return userCredential.user;
    } catch (e) {
      // يمكنك إدراج التعامل مع الأخطاء هنا
      throw e;
    }
  }

  // إنشاء حساب جديد
  Future<User?> signUp(String email, String password, String name) async {
    try {
      final UserCredential userCredential =
          await _auth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // حفظ اسم المستخدم في قاعدة البيانات
      if (userCredential.user != null) {
        final String userId = userCredential.user!.uid;
        await _database.saveUserName(userId, name);
      }

      return userCredential.user;
    } catch (e) {
      // يمكنك إدراج التعامل مع الأخطاء هنا
      throw e;
    }
  }

  // تسجيل الخروج
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } catch (e) {
      // يمكنك إدراج التعامل مع الأخطاء هنا
      throw e;
    }
  }

  // حفظ اسم المستخدم في قاعدة البيانات

  //
}
