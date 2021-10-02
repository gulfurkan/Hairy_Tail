import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class MyTextField extends StatelessWidget {
  final String text;

  final Icon icon;
  final textEditingController = TextEditingController();
  final bool pass;
  MyTextField(this.text, this.icon, this.pass);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      obscureText: !pass,
      decoration: InputDecoration(
        prefixIcon: icon,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        labelText: text,
      ),
    );
  }

  String get getText {
    return textEditingController.text;
  }
}
