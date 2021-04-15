// TODO Implement this library.// TODO Implement this library.// TODO Implement this library.import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/auth/widgets/constance.dart';
import 'package:e_commerce/view/auth/widgets/custom_button_social.dart';
import 'package:e_commerce/view/auth/widgets/custom_buttton.dart';
import 'package:e_commerce/view/auth/widgets/custom_text.dart';
import 'package:e_commerce/view/auth/widgets/custom_textForm.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class RegisterView extends GetWidget<AuthViewModel>{
  @override
  final GlobalKey<FormState>_formkey= GlobalKey<FormState>();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: GestureDetector(
              onTap: (){
                Get.off(LoginScreen());
              },
              child: Icon( Icons.arrow_back ,color: Colors.black,)),
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
                    text: 'Sign up ,',
                    fontSize: 30,
                  ),

                ]),
                SizedBox(
                  height: 30,
                ),
                CustomTextForm(
                  text: 'Name',
                  hint: 'Abdelrahman nabil',
                  onSave: (value) {
                    controller.name=value;
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
                CustomButton(
                  text: 'SIGN UP',
                  onPressed: () {
                    _formkey.currentState.save();
                    if(_formkey.currentState.validate())
                      controller.CreateAccountwithEmailAndPassword();

                  },
                ),





              ]),
            ),
          ),
        ));
  }
}
