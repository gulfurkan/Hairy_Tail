import 'package:flutter/material.dart';

class TextBox extends StatelessWidget {
  final String text;
  final String hintText;
  TextBox(this.text, this.hintText);
  final contrl = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(text),
          TextField(
            decoration: InputDecoration(
              hintText: hintText,
            ),
            controller: contrl,
          )
        ],
      ),
    );
  }

  String getText() {
    return contrl.text;
  }
}
