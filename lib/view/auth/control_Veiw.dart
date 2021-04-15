import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/core/view_model/controll_View.dart';

import 'package:e_commerce/view/auth/Crat_Veiw.dart';
import 'package:e_commerce/view/auth/HomeScreen.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/auth/profile_Veiw.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ControlView extends GetWidget<AuthViewModel> {


  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user == null)
          ? LoginScreen()
          : GetBuilder<ControllViewModel>(
          init: ControllViewModel(),
        builder: (controller)=> Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
          );
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControllViewModel>(
      init: Get.find(),
      builder: (controller) => Container(
        decoration: BoxDecoration(
          color: Colors.white
        ),
        child: BottomNavigationBar(

            items: [
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text('Explore'),
                ),
                title: Text(""),
                icon: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.asset(
                    'images/Icon_Explore.png',
                    fit: BoxFit.contain,
                    width: 20,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text('Cart'),
                ),
                title: Text(""),
                icon: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.asset(
                    'images/Icon_Cart.png',
                    fit: BoxFit.contain,
                    width: 20,
                  ),
                ),
              ),
              BottomNavigationBarItem(
                activeIcon: Padding(
                  padding: const EdgeInsets.only(top: 25),
                  child: Text('Account'),
                ),
                title: Text(""),
                icon: Padding(
                  padding: const EdgeInsets.only(top: 20.0),
                  child: Image.asset(
                    'images/Icon_User.png',
                    fit: BoxFit.contain,
                    width: 20,
                  ),
                ),
              ),
            ],
            elevation: 0.0,
            selectedItemColor: Colors.black,
            backgroundColor: Colors.grey.shade50,
            currentIndex: controller.navigtorValue,
            onTap: (index) {
              controller.chageSelectValue(index);

            }),
      ),
    );
  }
}
