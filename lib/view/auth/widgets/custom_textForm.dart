import 'package:flutter/material.dart';

import 'custom_text.dart';
class CustomTextForm extends StatelessWidget {

 final String text;
 final String hint ;
 final Function onSave;
 final Function validator;

CustomTextForm({ this.text, this.hint, this.onSave, this.validator}) ;
  @override
  Widget build(BuildContext context) {
    return Container(
child:     Column(
  children: [
    customText(
      text: text,
      fontSize: 14,
      color: Colors.grey.shade900,
    ),
    TextFormField(
      onSaved:  onSave,
      validator: validator,
      decoration: InputDecoration(
          hintText:hint ,
          hintStyle: TextStyle(
            color: Colors.grey,
          ),
          fillColor: Colors.white),
    )
  ],
),
    );
  }
}
