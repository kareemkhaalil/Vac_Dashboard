import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:project_management/models/admins_model.dart';
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
    } on FirebaseAuthException catch (e) {
      print('error in auth service at sign in : ${e.message}');
      // يمكنك إدراج التعامل مع الأخطاء هنا
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
        final String userEmail = userCredential.user!.email!;
        final String userPassword = password;

        // إنشاء كائن AdminModel
        final adminModel = AdminModel(
          id: userId,
          userName: name,
          email: userEmail,
          password: userPassword,
        );

        // تحويل AdminModel إلى خريطة
        final userData = adminModel.toJson();

        // تحويل البيانات إلى نوع Map<String, dynamic>
        final userDataMap = Map<String, dynamic>.from(userData);

        // حفظ البيانات في قاعدة البيانات
        await _database.saveUserData(userId, userDataMap);
      }

      return userCredential.user;
    } on FirebaseAuthException catch (e) {
      print('error in auth service at sign up : ${e.message}');
      // يمكنك إدراج التعامل مع الأخطاء هنا
      // مثلاً، يمكنك إظهار رسالة خطأ للمستخدم
      throw ('Error during sign up: ${e.message}');
    }
  }

  // تسجيل الخروج
  Future<void> signOut() async {
    try {
      await _auth.signOut();
    } on FirebaseAuthException catch (e) {
      print('error in auth service at sign out : ${e.message}');
      // يمكنك إدراج التعامل مع الأخطاء هنا
    }
  }

  // حفظ اسم المستخدم في قاعدة البيانات

  //
}
