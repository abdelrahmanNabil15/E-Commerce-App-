import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:firebase_core/firebase_core.dart';

class  FireStoreUser{

  final CollectionReference _userCollectionRef =
      FirebaseFirestore.instance.collection("Users");
Future<void>  addUserToFireStore(User_model user_model)async{
  await _userCollectionRef.doc(user_model.userId).set(user_model.toJson());
}

Future<DocumentSnapshot>getCurrentUser(String uid)async{
  return await _userCollectionRef.doc(uid).get();
}
}