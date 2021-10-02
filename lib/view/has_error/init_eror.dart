import 'package:flutter/material.dart';

class InitError extends StatelessWidget {
  const InitError({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(child: Text("başlatılamadı")),
      ),
    );
  }
}
