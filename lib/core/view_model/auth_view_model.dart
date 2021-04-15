import 'package:e_commerce/core/view_model/service/Firestroe_user.dart';
import 'package:e_commerce/helper/LocalStoreageData.dart';
import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/view/auth/HomeScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';

import 'controll_View.dart';

class AuthViewModel extends GetxController {
  GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ['email']);
  FirebaseAuth _auth = FirebaseAuth.instance;
  FacebookLogin _facebookLogin = FacebookLogin();
  String email, password, name;
  Rxn<User> _user = Rxn<User>();

  String get user => _user.value?.email;
  final LocalStorgeData localStorgeData = Get.find();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    _user.bindStream(_auth.authStateChanges());
  }

  @override
  void onReady() {
    // TODO: implement onReady
    super.onReady();
  }

  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
  }

  void googleSignInMethod() async {
    final GoogleSignInAccount googleUser = await _googleSignIn.signIn();
    GoogleSignInAuthentication googleSignAuthentication =
        await googleUser.authentication;
    final AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: googleSignAuthentication.accessToken,
      idToken: googleSignAuthentication.idToken,
    );

    UserCredential userCredential =
        await _auth.signInWithCredential(credential).then((user) async {
      saveUser(user);
    });
    Get.offAll(HomeScreen());
  }

  void FacebookLoginMethod() async {
    FacebookLoginResult result =
        await _facebookLogin.logIn(customPermissions: ['email']);
    final accessToken = result.accessToken.token;
    if (result.status == FacebookLoginStatus.success) {
      final faceCredential = FacebookAuthProvider.credential(accessToken);
      await _auth.signInWithCredential(faceCredential);
    }
  }

  void signInwithEmailAndPassword() async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password).then((value)async{
        await FireStoreUser().getCurrentUser(value.user.uid).then((value) {
          setUser(User_model.fromJson(value.data()));
        });
      });
      Get.offAll(ControllViewModel());
    } catch (e) {
      print(e.message);
      Get.snackbar('Error login account', e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void CreateAccountwithEmailAndPassword() async {
    try {
      await _auth
          .createUserWithEmailAndPassword(email: email, password: password)
          .then((user) async {
        saveUser(user);
      });
      Get.offAll(HomeScreen());
    } catch (e) {
      print(e.message);
      Get.snackbar('Error Create  account', e.message,
          colorText: Colors.black, snackPosition: SnackPosition.BOTTOM);
    }
  }

  void saveUser(UserCredential user) async {
    User_model user_model = User_model(
      userId: user.user.uid,
      email: user.user.email,
      name: name,
      pic: '',
    );
    await FireStoreUser().addUserToFireStore(user_model);
    setUser(user_model);
  }

  void setUser(User_model user_model) async {
    await localStorgeData.setUesr(user_model);
  }
}
