import 'dart:convert';

import 'package:e_commerce/model/user_model.dart';
import 'package:e_commerce/view/auth/widgets/constance.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorgeData extends GetxController{
  Future< User_model>get getUser async{

    try{
User_model user_model =await _getUesrData ();
 if(user_model==null){
   return null;
 }
    }catch(e){
      print( e.toString());
      return null;
    }
  }

_getUesrData ()async {
  SharedPreferences prefs =await SharedPreferences.getInstance();
  var value = prefs.getString(CAHED_USER_DATA);
  return User_model.fromJson(json.decode(value));
}
setUesr(User_model user_model)async{


  SharedPreferences prefs =await SharedPreferences.getInstance();
  await prefs.setString('user', json.encode(user_model.toJson()));
}
  void deleteUser()async{
  SharedPreferences  prefs = SharedPreferences.getInstance() as SharedPreferences;
    await prefs.clear();

  }

}