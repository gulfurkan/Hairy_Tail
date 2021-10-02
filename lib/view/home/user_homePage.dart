// ignore: unused_import
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import 'package:hairy_tail/view/create_account/create_account.dart';
import 'package:hairy_tail/view/home/user_home_view.dart';
import 'package:hairy_tail/view/login/create_account.dart';
import 'package:hairy_tail/view/login/login_view.dart';
import 'package:hairy_tail/widgets/drawer_widget/drawer.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String string = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
      body: FirebaseAuth.instance.currentUser != null
          ? UserHomePageView()
          : LogView(),
      drawer: DrawerWidget(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}

class LogView extends StatelessWidget {
  const LogView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.pink,
        leading: Builder(
            builder: (context) => IconButton(
                  icon: new Image.asset(
                      "assets/images/icons8-barber-scissors-96.png"),
                  onPressed: () {},
                )),
        title: Text(
          "HairyTail",
          textAlign: TextAlign.center,
        ),
      ),
      body: LoginView(),
      // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
