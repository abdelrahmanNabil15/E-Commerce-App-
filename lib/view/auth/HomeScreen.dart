import 'package:e_commerce/model/Home_View_model.dart';
import 'package:e_commerce/view/auth/details_view.dart';
import 'package:e_commerce/view/auth/login_screen.dart';
import 'package:e_commerce/view/auth/widgets/constance.dart';
import 'package:e_commerce/view/auth/widgets/custom_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/get.dart';
import 'package:cached_network_image/cached_network_image.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      init: Get.find(),
      builder: (controller) => controller.loading.value
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: SingleChildScrollView(
                child: Container(
                  padding: EdgeInsets.only(top: 100, right: 20, left: 20),
                  child: Column(
                    children: [
                      _SearchTextFormField(),
                      SizedBox(
                        height: 20,
                      ),
                      customText(
                        text: 'Categories ',
                        alignment: Alignment.topLeft,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      _listViewCategory(),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          customText(
                            text: " Best Selling",
                            fontSize: 18,
                          ),
                          customText(
                            text: "See all",
                            fontSize: 16,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      _listViewProducts(),
                    ],
                  ),
                ),
              ),
            ),
    );
  }

  Widget _SearchTextFormField() {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20), color: Colors.grey.shade200),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }

  Widget _listViewCategory() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          itemCount: controller.categoryModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: Colors.grey.shade100,
                  ),
                  height: 60,
                  width: 60,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Image.network(controller.categoryModel[index].image),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                customText(
                  text: controller.categoryModel[index].name,
                ),
              ],
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }

  Widget _listViewProducts() {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 350,
        child: ListView.separated(
          itemCount: controller.productModel.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {

                Get.to(DetailsView(
                  model: controller.productModel[index],
                ));
              },
              child: Container(
                width: MediaQuery.of(context).size.width * .4,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade100,
                      ),
                      child: Container(
                          height: 220,
                          width: MediaQuery.of(context).size.width * .4,
                          child: Image.network(
                            controller.productModel[index].image,
                            fit: BoxFit.fill,
                          )),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    customText(
                      text: controller.productModel[index].name,
                      alignment: Alignment.bottomLeft,
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    customText(
                      text: controller.productModel[index].description,
                      color: Colors.grey,
                      alignment: Alignment.bottomLeft,
                      maxline: 1,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    customText(
                      text: controller.productModel[index].price.toString() +
                          " \$",
                      color: primaryColor,
                      alignment: Alignment.bottomLeft,
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}
