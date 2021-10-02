import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hairy_tail/view/has_error/init_eror.dart';
import 'package:hairy_tail/view/home/user_homePage.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp().whenComplete(() => runApp(MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire
      future: Firebase.initializeApp(),
      builder: (context, snapshot) {
        // Check for errors
        if (snapshot.hasError) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            home: InitError(),
          );
        }

        // Once complete, show your application
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
              debugShowCheckedModeBanner: false, home: logChecker());
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: MyHomePage(
            title: "Yükleniyor",
          ),
        );
      },
    );
  }

  logChecker() {
    FirebaseAuth _instance = FirebaseAuth.instance;

    if (_instance.currentUser == null)
      return LogView();
    else
      return MyHomePage(
        title: "Hairy Tail",
      );
  }
}
