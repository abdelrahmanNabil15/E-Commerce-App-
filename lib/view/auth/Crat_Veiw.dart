

import 'package:e_commerce/view/auth/widgets/constance.dart';
import 'package:e_commerce/view/auth/widgets/custom_buttton.dart';
import 'package:e_commerce/view/auth/widgets/custom_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CratView extends StatelessWidget {
  final itemsList = List<String>.generate(3, (n) => "List item ${n}");

  ListView generateItemsList() {
    return ListView.builder(
        itemCount: itemsList.length,
        itemBuilder: (context, index) {
          return Column(
            children: <Widget>[
              Dismissible(
                background: slideRightBackground(),
                secondaryBackground: slideLeftBackground(),
                key: Key(itemsList[index]),
                child: Container(
                    child: Column(
                  children: <Widget>[
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.all(10),
                            child: Image.asset(
                              'images/Image.png',
                              height: 120,
                              width: 120,
                            )),
                        SizedBox(
                          width: 50,
                        ),
                        Column(
                          children: <Widget>[
                            customText(
                              text: 'Tag Heuer Wristwatch',
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            Container(
                              padding: EdgeInsets.only(right: 100),
                              child: customText(
                                text: '\$1100',
                                color: primaryColor,
                                alignment: Alignment.bottomLeft,
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              children: [
                                Container(
                                  padding: EdgeInsets.all(5),
                                  width:
                                      MediaQuery.of(context).size.width * .30,
                                  decoration: BoxDecoration(
                                    color: Colors.grey.shade200,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceAround,
                                    children: [
                                      GestureDetector(
                                          onTap: _ACounter,
                                          child: Icon(Icons.add)),
                                      customText(
                                        text: '$_counter',
                                      ),
                                      GestureDetector(
                                          onTap: _MCounter,
                                          child: Icon(Icons.remove))
                                    ],
                                  ),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    ),
                  ],
                )),
                confirmDismiss: (direction) async {
                  if (direction == DismissDirection.endToStart) {
                    final bool res = await showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Text(
                                "Are you sure you want to delete ${itemsList[index]}?"),
                            actions: <Widget>[
                              FlatButton(
                                child: Text(
                                  "Cancel",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {
                                  Get.to(CratView());
                                },
                              ),
                              FlatButton(
                                child: Text(
                                  "Delete",
                                  style: TextStyle(color: Colors.red),
                                ),
                                onPressed: () {
                                  setState(() {
                                    itemsList.removeAt(index);
                                  });
                                  Get.to(CratView());
                                },
                              ),
                            ],
                          );
                        });
                    return res;
                  } else {}
                },
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: <Widget>[
        Expanded(
          child: generateItemsList(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 30,right: 30),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                children: <Widget>[
                  customText(
                    text: "ToTal",
                    fontSize: 22,
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  customText(
                    text: '\$ 2000',
                    fontSize: 18,
                    color: primaryColor,
                  )
                ],
              ),
              Container(
                padding: EdgeInsets.all(20),
                height: 100,
                width: 180,
                child: CustomButton(

                  onPressed: (){},
                  text: 'CHECKOUT',
                ),
              )
            ],
          ),
        )
      ],
    ));
  }

  Widget slideRightBackground() {
    return Container(
      color: Color.fromRGBO(255, 193, 7, 1),
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              width: 20,
            ),
            Icon(
              Icons.star,
              color: Colors.white,
            ),
          ],
        ),
        alignment: Alignment.centerLeft,
      ),
    );
  }

  Widget slideLeftBackground() {
    return Container(
      color: Colors.red,
      child: Align(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[
            Icon(
              Icons.delete,
              color: Colors.white,
            ),
            Text(
              " Delete",
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.w700,
              ),
              textAlign: TextAlign.right,
            ),
            SizedBox(
              width: 20,
            ),
          ],
        ),
        alignment: Alignment.centerRight,
      ),
    );
  }

  int _counter = 0;

  Future<void> _ACounter() async {
    _counter++;
  }

  void _MCounter() async {
    if (_counter > 0) {
      _counter--;
    }
  }

  void setState(Null Function() param0) {}
}
