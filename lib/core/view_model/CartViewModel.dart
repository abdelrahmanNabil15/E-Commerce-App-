import 'package:e_commerce/helper/Databsehelper.dart';
import 'package:e_commerce/model/cartModel.dart';
import 'package:get/get.dart';
import 'package:flutter/cupertino.dart';
class CartViewModel extends GetxController{

ValueNotifier<bool> get loading => _loading;

ValueNotifier<bool> _loading=ValueNotifier(false);
List<CartModel> _cartModel=[];
List<CartModel>get  cartModel =>_cartModel;
CartViewModel(){

  getallproduct();
}
getallproduct()async{

  _loading.value=true;
  var dbHelper =DatabaseHelper.db;
print(_cartModel.length);
  _cartModel= await dbHelper.getallproduct();
  _loading.value= false;
  update();

}
addProduct( CartModel  cartModel)async{

  var dbHelper =DatabaseHelper.db;
  await dbHelper.insert(cartModel);
  update();
}
}