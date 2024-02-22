import 'package:myntra_clone/consts/consts.dart';

class FirestoreServices{
  //get user data
  static getUser(uid){
    return firestore.collection(userCollection).where('id',isEqualTo: uid).snapshots();
  }
}