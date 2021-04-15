import 'dart:developer';

import 'package:e_commerce/helper/LocalStoreageData.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

class profileViewModel extends GetxController{
final LocalStorgeData localStorgeData =Get.find();
void onInit(){

  super.onInit();
  getCurrentUser();
}
User_model get user_model=> _user_model;
User_model _user_model;

Future< void>signOut()async{

  GoogleSignIn().signOut();
  FirebaseAuth.instance.signOut();
  localStorgeData.deleteUser();
}

  void getCurrentUser() async{
  await localStorgeData.getUser.then((value){
    _user_model=value;
  });
update();
  }


}