import 'package:firebase_storage/firebase_storage.dart';

class StorageService {
  final FirebaseStorage _storage = FirebaseStorage.instance;

  Future<String> uploadFile(String path, String fileName, dynamic file) async {
    try {
      final Reference storageRef = _storage.ref().child(path).child(fileName);
      final UploadTask uploadTask = storageRef.putFile(file);

      final TaskSnapshot snapshot = await uploadTask;
      final String downloadURL = await snapshot.ref.getDownloadURL();

      return downloadURL;
    } catch (e) {
      // يمكنك إدراج التعامل مع الأخطاء هنا
      throw e;
    }
  }

  // يمكنك إضافة المزيد من الوظائف الأخرى للتعامل مع التخزين هنا
}
