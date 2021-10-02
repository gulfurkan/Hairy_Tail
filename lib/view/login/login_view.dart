import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hairy_tail/view/home/user_homePage.dart';
import 'package:hairy_tail/view/login/create_account.dart';
import 'package:hairy_tail/widgets/text_box/my_text_field.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MyTextField email = MyTextField("E-mail", Icon(Icons.mail), true);
    MyTextField sifre = MyTextField("Şifre", Icon(Icons.lock_rounded), false);

    return Scaffold(
        body: Container(
            child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Title(
            color: Colors.grey[100],
            child: Text(
              "Oturum Aç",
              style: TextStyle(color: Colors.grey[850], fontSize: 24),
            )),
        email,
        sifre,
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            RaisedButton(
              onPressed: () {
                FirebaseAuth.instance
                    .signInWithEmailAndPassword(
                        email: email.getText, password: sifre.getText)
                    .then((value) => Navigator.pushReplacement(context,
                        MaterialPageRoute(builder: (context) => MyHomePage())));
              },
              color: Colors.green,
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Giriş",
                style: TextStyle(
                    fontSize: 14, letterSpacing: 2.2, color: Colors.white),
              ),
            ),
            RaisedButton(
              onPressed: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => CreateAccountView()));
              },
              color: Colors.lightGreen,
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Hesap Oluştur",
                style: TextStyle(
                    fontSize: 14, letterSpacing: 2.2, color: Colors.white),
              ),
            ),
          ],
        )
      ],
    )));
  }
}
