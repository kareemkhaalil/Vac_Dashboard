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
      //final QuerySnapshot adminsSnapshot = await adminsCollection.get();

      // استخدام المجموعة الحالية لإضافة المستند بالمستخدم الحالي

      final DocumentSnapshot userDoc = await adminsCollection.doc(userId).get();

      if (userDoc.exists) {
        // المستند موجود بالفعل، قم بتحديث البيانات
        await adminsCollection
            .doc(userId)
            .update(Map<String, dynamic>.from(userData));
      } else {
        // المستند غير موجود، قم بإضافته
        await adminsCollection
            .doc(userId)
            .set(Map<String, dynamic>.from(userData));
      }
    } catch (e) {
      // يمكنك إدراج التعامل مع الأخطاء هنا
      throw (' error in database service at save user data : $e');
    }
  }

  // يمكنك إضافة المزيد من الوظائف الأخرى للتعامل مع قاعدة البيانات هنا
}
