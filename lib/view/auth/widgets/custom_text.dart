import 'package:flutter/material.dart';

class customText extends StatelessWidget {
  @override
  final String text;
  final double fontSize;

  final Color color;
final Alignment alignment;
  final int maxline;
 final FontWeight fontWeight;

  customText(
      {     this.text='',
      this.fontSize =16,
      this.color = Colors.black,
        this.alignment =Alignment.topLeft,
        this.maxline,this.fontWeight,
});

  @override
  Widget build(BuildContext context) {

    return Container(
      alignment:  alignment ,
      child: Text(

        text,


        maxLines: maxline,
        style: TextStyle(
          color: color,
          fontSize: fontSize,
          fontWeight:fontWeight,
        ),
      ),
    );
  }
}
