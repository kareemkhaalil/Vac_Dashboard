import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<DocumentSnapshot> getUserData(String userId) async {
    try {
      final DocumentSnapshot userSnapshot =
          await _firestore.collection('users').doc(userId).get();
      return userSnapshot;
    } catch (e) {
      // يمكنك إدراج التعامل مع الأخطاء هنا
      throw (' error in database service at get user data : $e');
    }
  }

  // حفظ اسم المستخدم في قاعدة البيانات
// حفظ اسم المستخدم في قاعدة البيانات
  Future<void> saveUserData(
      String userId, Map<String, dynamic> userData) async {
    try {
      final CollectionReference adminsCollection =
          FirebaseFirestore.instance.collection('admins');
      final QuerySnapshot adminsSnapshot = await adminsCollection.get();

      // التحقق من وجود مجموعة المشرفين
      if (adminsSnapshot.docs.isEmpty) {
        // إنشاء مجموعة المشرفين وإضافة مستند جديد بالمستخدم الحالي
        final DocumentReference adminDoc = await adminsCollection.add({});
        final CollectionReference usersCollection =
            adminDoc.collection('admins');
        await usersCollection.doc(userId).set(userData);
      } else {
        // استخدام المجموعة الحالية لإضافة المستند بالمستخدم الحالي
        final DocumentReference adminDoc = adminsSnapshot.docs.first.reference;
        final CollectionReference usersCollection =
            adminDoc.collection('admins');
        await usersCollection.doc(userId).set(userData);
      }
    } catch (e) {
      // يمكنك إدراج التعامل مع الأخطاء هنا
      throw (' error in database service at save user data : $e');
    }
  }

  // يمكنك إضافة المزيد من الوظائف الأخرى للتعامل مع قاعدة البيانات هنا
}
