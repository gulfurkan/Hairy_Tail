import 'package:flutter/material.dart';

class MyAppBar extends StatelessWidget {
  const MyAppBar({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink,
        leading: Builder(
            builder: (context) => IconButton(
                  icon: new Image.asset(
                      "assets/images/icons8-barber-scissors-96.png"),
                  onPressed: () => Scaffold.of(context).openDrawer(),
                )),
        title: Text(
          "HairyTail",
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
