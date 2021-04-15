import 'package:e_commerce/view/auth/Crat_Veiw.dart';
import 'package:e_commerce/view/auth/HomeScreen.dart';
import 'package:e_commerce/view/auth/profile_Veiw.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ControllViewModel extends GetxController{
  Widget _currentScreen = HomeScreen();
  int _navigtorValue=0;
  get navigtorValue=>_navigtorValue;
  get currentScreen=>_currentScreen;
  void chageSelectValue(int selectEdValue){
    _navigtorValue =selectEdValue;
    switch (selectEdValue) {
      case 0:
        {
          _currentScreen = HomeScreen();
          break;
        }
      case 1:
        {

          _currentScreen = CratView();
          break;
        }
      case 2: {
        _currentScreen=ProfileVeiw();
      }
    }
    update();
  }

}