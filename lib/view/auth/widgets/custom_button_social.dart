import 'package:flutter/material.dart';

import 'custom_text.dart';
class ButtonSocial extends StatelessWidget {

  final Function onPressed;
  final String text;

  final String image;

  ButtonSocial({  this.onPressed, this.text, this.image});
  @override
  Widget build(BuildContext context) {
    return    Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.grey.shade100,
      ),
      child: FlatButton(
          padding: EdgeInsets.all(15),
          onPressed: onPressed,
          child: Row(children: [
            Image.network(
              image,
              width: 30,
              height: 30,
            ),
            SizedBox(
              width: 90,
            ),
            customText(text:  text ,alignment: Alignment.center,),
          ])),
    );
  }
}
