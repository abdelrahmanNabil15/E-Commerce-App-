
import 'package:e_commerce/core/view_model/CartViewModel.dart';
import 'package:e_commerce/core/view_model/auth_view_model.dart';
import 'package:e_commerce/core/view_model/controll_View.dart';
import 'package:e_commerce/core/view_model/profile_View_Model.dart';
import 'package:e_commerce/helper/LocalStoreageData.dart';
import 'package:e_commerce/model/Home_View_model.dart';
import 'package:e_commerce/view/auth/Crat_Veiw.dart';



import 'package:get/get.dart';
class Binding extends Bindings{
  @override
  void dependencies() {
    Get.lazyPut(() => AuthViewModel());
    Get.lazyPut(() => ControllViewModel());
    Get.lazyPut(() => HomeViewModel ());
    Get.lazyPut(() => CartViewModel  ());
    Get.lazyPut(() =>LocalStorgeData ());
  }


}