import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/auth/resigter_Screen.dart';
import 'package:e_commerce/view/auth/widgets/constance.dart';
import 'package:e_commerce/view/auth/widgets/custom_button_social.dart';
import 'package:e_commerce/view/auth/widgets/custom_buttton.dart';
import 'package:e_commerce/view/auth/widgets/custom_text.dart';
import 'package:e_commerce/view/auth/widgets/custom_textForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class LoginScreen extends GetWidget<AuthViewModel>{
  @override
final GlobalKey<FormState>_formkey= GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.white,
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 50,
              right: 20,
              left: 20,
            ),
            child: Form(

             key: _formkey,
              child: Column(children: [
                Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                  customText(
                    text: 'Welcome,',
                    fontSize: 30,
                  ),
                  GestureDetector(
                    onTap: (){
                     Get.to(RegisterView());

                    },
                    child: customText(
                      text: 'Sign UP,',

                      fontSize: 16,
                      color: primaryColor,
                    ),
                  ),
                ]),
                SizedBox(
                  height: 10,
                ),
                customText(
                  text: 'Sign in to contiune,',
                  fontSize: 14,
                  color: Colors.grey,
                  alignment: Alignment.topLeft,
                ),
                SizedBox(
                  height: 30,
                ),
                CustomTextForm(
                  text: 'Email',
                  hint: 'naabdo1398@gmail.com',
                  onSave: (value) {
                    controller.email=value;
                  },
                  validator: (value) {
                    if(value==null){
                      print('ERRoR');
                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                CustomTextForm(
                  text: 'password',
                  hint: '**************',
                  onSave: (value) {
                    controller.password=value;

                  },
                  validator: (value) {
                    if(value==null){
                      print("ERROR in password");

                    }
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                customText(
                  text: "Forget password!",
                  fontSize: 14,
                  alignment: Alignment.topRight,
                ),
                SizedBox(
                  height: 20,
                ),
                CustomButton(
                  text: 'SIGN IN',
                  onPressed: () {
                    _formkey.currentState.save();
                    if(_formkey.currentState.validate())
                    controller.signInwithEmailAndPassword();

                  },
                ),
                SizedBox(
                  height: 20,
                ),
                customText(
                  text: '-OR-',
                  alignment: Alignment.center,
                  fontSize: 20,
                ),
                SizedBox(
                  height: 20,
                ),
                ButtonSocial(
                  text: 'Sign in  with facebook',
                  onPressed: () {

                  },
                  image:
                      "https://icon-library.com/images/small-facebook-icon-for-website/small-facebook-icon-for-website-13.jpg",
                ),
                SizedBox(
                  height: 10,
                ),
                ButtonSocial(
                  text: 'Sign in  with Google',
                  onPressed: () {
                    controller.googleSignInMethod();
                  },
                  image: "https://img.icons8.com/cute-clipart/2x/google-logo.png",
                ),
              ]),
            ),
          ),
        ));
  }
}
