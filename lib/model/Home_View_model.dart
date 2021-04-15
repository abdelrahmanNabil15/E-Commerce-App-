import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:e_commerce/core/view_model/Product_model.dart';
import 'file:///C:/Users/xcxzy/AndroidStudioProjects/e_commerce/lib/model/cartModel.dart';
import 'file:///C:/Users/xcxzy/AndroidStudioProjects/e_commerce/lib/model/cartModel.dart';
import 'file:///C:/Users/xcxzy/AndroidStudioProjects/e_commerce/lib/model/cartModel.dart';

import 'package:e_commerce/core/view_model/category_model.dart';
import 'package:e_commerce/core/view_model/service/home_service.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class HomeViewModel extends GetxController{
  ValueNotifier<bool> get loading=>_loading;

  ValueNotifier<bool>_loading=ValueNotifier(false);
  List<CategoryModel>get categoryModel=>_categoryModel;
List<CategoryModel> _categoryModel=[];

List<CartModel>get cartModel=>_cartModel;
 List<CartModel>_cartModel=[];


  List<ProductModel>get productModel=>_productModel;
List<ProductModel> _productModel=[];

HomeViewModel(){
  getCategory();
  getBestSellingProduct();


}
  getCategory()async
  {
    _loading.value=true;
homeSrvice().getCategory().then((value) {
 for(int i=0;i<value.length;i++){
   _categoryModel.add( CategoryModel.fromJson(value[i].data()));
   print(value[i].data());
   _loading.value=false;
 }

 update();
    });

  }
  getBestSellingProduct() async{
  _loading.value= true;
  homeSrvice().getBestSelling().then((value) {
    for(int i=0;i<value.length;i++){
      _productModel.add( ProductModel.fromJson(value[i].data()));
      print(value.length);
      _loading.value=false;
    }
update();
  });

  }



}