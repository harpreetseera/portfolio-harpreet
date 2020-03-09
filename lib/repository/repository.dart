import 'package:firebase_storage/firebase_storage.dart';

class Repository{

  Future<String> getImageUrl(String imagePath)async{
  String imageUrl = await FirebaseStorage.instance.ref().child(imagePath).getDownloadURL();
  return imageUrl;
  }
}