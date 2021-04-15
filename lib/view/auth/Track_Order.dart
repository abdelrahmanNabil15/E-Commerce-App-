import 'package:e_commerce/view/auth/widgets/constance.dart';
import 'package:e_commerce/view/auth/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TrackOrder extends StatelessWidget {
  final itemsList = List<String>.generate(6, (n) => "List item ${n}");

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.white,
        iconTheme: IconThemeData(),
        title: customText(
          text: 'Track Order',
          fontSize: 18,
          alignment: Alignment.center,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(color: Colors.white),
          padding: EdgeInsets.all(10),
          child: Column(children: [
            SizedBox(
              height: 30,
            ),
            ListView.builder(
                shrinkWrap: true,
                itemCount: itemsList.length,
                itemBuilder: (context, index) {
                  return Container(
                    child: Column(
                      children: [
                        customText(
                          text: 'Sept 23, 2018',
                          color: Colors.grey.shade600,
                        ),
                        SizedBox(height: 10,),
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.white,
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey.withOpacity(0.1),
                                  spreadRadius: 5,
                                  blurRadius: 7,
                                  offset: Offset(
                                      0, 3), // changes position of shadow
                                ),
                              ],
                            ),
                            child: Column(children: [

                              Row(
                                children: [
                                  Column(
                                    children: <Widget>[
                                      Container(
                                        padding: EdgeInsets.only(left: 8),
                                        child: customText(
                                          text: 'Tag Heuer Wristwatch',
                                        ),
                                      ),
                                      SizedBox(
                                        height: 3,
                                      ),
                                      Container(
                                        padding: EdgeInsets.only(right: 80),
                                        child: customText(
                                          text: '\$1100',
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                          alignment: Alignment.bottomLeft,
                                        ),
                                      ),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(5),
                                        width: MediaQuery.of(context)
                                                .size
                                                .width *
                                            .25,
                                        decoration: BoxDecoration(
                                          color: Color.fromRGBO(
                                              255, 193, 7, 1),
                                        ),
                                        child: customText(
                                          text: 'In Transit',
                                          color: Colors.white,
                                          alignment: Alignment.center,
                                        ),
                                      )
                                    ],
                                  ),
                                  SizedBox(
                                    width: 50,
                                  ),
                                  Container(
                                      padding: EdgeInsets.all(10),
                                      child: Image.asset(
                                        'images/Image.png',
                                        height: 120,
                                        width: 120,
                                      )),
                                ],
                              ),
                            ])),
                        SizedBox(
                          height: 20,
                        )
                      ],
                    ),
                  );
                }),
          ]),
        ),
      ),
    );
  }
}
