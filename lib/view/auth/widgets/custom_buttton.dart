import 'package:flutter/material.dart';

import 'constance.dart';
import 'custom_text.dart';

class CustomButton extends StatelessWidget {
  final String text;
  final Function onPressed;

  CustomButton({this.text = "", this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: customText(
        text: text,
        alignment: Alignment.center,
        color: Colors.white,
      ),
      padding: EdgeInsets.all(18),
      color: primaryColor,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
          side: BorderSide(color: primaryColor)),
    );
  }
}
