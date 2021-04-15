import 'package:e_commerce/core/view_model/CartViewModel.dart';
import 'package:e_commerce/core/view_model/Product_model.dart';
import 'package:e_commerce/model/Home_View_model.dart';
import 'package:e_commerce/model/cartModel.dart';
import 'package:e_commerce/view/auth/widgets/constance.dart';
import 'package:e_commerce/view/auth/widgets/custom_buttton.dart';
import 'package:e_commerce/view/auth/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DetailsView extends StatelessWidget {
  ProductModel model;

  DetailsView({this.model});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Scaffold(
        body: Container(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 270,
                child: Image.network(model.image, fit: BoxFit.fill),
              ),
              SizedBox(
                height: 15,
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Column(
                  children: <Widget>[
                    customText(
                        text: ' Nike Dri-FIT Long Sleeve',
                        fontSize: 26,
                        alignment: Alignment.topLeft,
                        fontWeight: FontWeight.bold),
                    SizedBox(
                      height: 15,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * .45,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              customText(
                                text: 'Size',
                              ),
                              customText(
                                text: model.sized,
                              ),
                            ],
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(10),
                          width: MediaQuery.of(context).size.width * .44,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(35),
                              border: Border.all(color: Colors.grey)),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              customText(
                                text: 'Color',
                              ),
                              customText(
                                text: model.sized,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    customText(
                      text: 'Details',
                      fontSize: 18,
                      alignment: Alignment.topLeft,
                      fontWeight: FontWeight.bold,
                    ),
                    SizedBox(
                      height: 15,
                    ),
                    customText(
                        text: model.description,
                        alignment: Alignment.topLeft,
                        fontSize: 18),
                    SizedBox(
                      height: 45,
                    ),
                    Container(

                      alignment: Alignment.bottomCenter,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.all(10),
                              width: MediaQuery.of(context).size.width * .25,
                              child: Column(
                                children: <Widget>[
                                  customText(
                                    text: "PRICE",
                                    fontSize: 12,
                                  ),
                                  customText(
                                    text: model.price.toString() + " \$",
                                    color: primaryColor,
                                    fontWeight:FontWeight.bold ,
                                    fontSize: 18,
                                  ),
                                ],
                              ),
                            ),
                            GetBuilder<CartViewModel  >(
                              init: CartViewModel(),
                              builder: (controller)=> Align(

                                  alignment: Alignment.bottomRight,
                                child: Container(

                                  width: MediaQuery.of(context).size.width * .44,
                                  child: CustomButton(
                                    text: 'ADD',
                                    onPressed:(){controller.addProduct(

                                      CartModel(
                                         name: model.name,
                                        image: model.image,
                                        price: model.price,
                                        quantity: 1,
                                      )


                                    );}
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
