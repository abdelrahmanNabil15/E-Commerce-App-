import 'package:e_commerce/core/view_model/profile_View_Model.dart';
import 'package:e_commerce/view/auth/Checkout_Delivery.dart';
import 'package:e_commerce/view/auth/Track_Order.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/auth/widgets/custom_buttton.dart';
import 'package:e_commerce/view/auth/widgets/custom_text.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ProfileVeiw extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<profileViewModel>(
      init:profileViewModel() ,
    builder: (controller)=> Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Row(
                children: [
                  Container(
                    height: 120,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),

                   image:DecorationImage(
                    image:controller.user_model==null ?


                   AssetImage('images/Avatar.png'):controller.user_model.pic=='default'?     AssetImage('images/Avatar.png'): NetworkImage(controller.user_model.pic),

                    ),
                  ),),
                  SizedBox(
                    width: 40,
                  ),
                  Column(
                    children: <Widget>[
                      customText(
                        text: controller.user_model.name,
                        fontSize: 26,
                      ),
                      customText(
                        text: 'iamdavid@gmail.com',
                        fontSize: 14,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: 100,
              ),
              Row(
                children: [
                  Container(
                    child: Image.asset(
                      '   ',
                      height: 40,
                      width: 40,
                    ),
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  customText(
                    text: 'Edit Profile',
                    fontSize: 18,
                  ),
                  SizedBox(
                    width: 197,
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset(
                    'images/Icon_Location.png',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  customText(
                    text: 'Shipping Address',
                    fontSize: 18,
                  ),
                  SizedBox(
                    width: 150,
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset(
                    'images/Icon_History.png',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  customText(
                    text: 'Order History',
                    fontSize: 18,
                  ),
                  SizedBox(
                    width: 180,
                  ),
                  GestureDetector(
                      onTap: () {
                        Get.to(MyApp());
                      },
                      child: Icon(Icons.arrow_forward_ios)),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset(
                    'images/Icon_Payment.png',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  customText(
                    text: 'Cards',
                    fontSize: 18,
                  ),
                  SizedBox(
                    width: 235,
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset(
                    'images/Icon_Alert.png',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  customText(
                    text: 'Notifications',
                    fontSize: 18,
                  ),
                  SizedBox(
                    width: 182,
                  ),
                  Icon(Icons.arrow_forward_ios),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Image.asset(
                    'images/Icon_Exit.png',
                    height: 40,
                    width: 40,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                 CustomButton(
                    text: 'Log Out',
                    onPressed: (){

controller.signOut();
Get.offAll(LoginScreen());
                    },
                  ),
                  SizedBox(
                    width: 217,
                  ),
                  Icon(Icons.arrow_forward_ios)
                ],
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        ),
    );

  }
}
