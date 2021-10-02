import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hairy_tail/constants/user_class.dart';
import 'package:hairy_tail/view/home/user_homePage.dart';
import 'package:hairy_tail/view/home/user_home_view.dart';
import 'package:hairy_tail/widgets/text_box/my_text_field.dart';

class CreateAccountView extends StatelessWidget {
  MyTextField isim =
      MyTextField("Kullanıcı Adı", Icon(Icons.account_circle_rounded), true);
  MyTextField email = MyTextField("E-Mail", Icon(Icons.mail), true);
  MyTextField tel = MyTextField("Telefon", Icon(Icons.phone), true);
  MyTextField sif = MyTextField("Şifre", Icon(Icons.lock_rounded), false);
  MyTextField siftek =
      MyTextField("Şifrenizi Doğrulayın", Icon(Icons.lock_rounded), false);

  CreateAccountView() {}

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
      body: Container(
        child: ListView(
          children: [
            SizedBox(
              height: 50,
            ),
            isim,
            SizedBox(
              height: 50,
            ),
            email,
            SizedBox(
              height: 50,
            ),
            tel,
            SizedBox(
              height: 50,
            ),
            sif,
            SizedBox(
              height: 50,
            ),
            siftek,
            SizedBox(
              height: 50,
            ),
            RaisedButton(
              onPressed: () {
                kayityap(isim.getText, email.getText, tel.getText, sif.getText,
                    sif.getText, context);
              },
              color: Colors.green,
              elevation: 8,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Kaydet",
                style: TextStyle(
                    fontSize: 14, letterSpacing: 2.2, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void kayityap(String isim, String email, String tel, String sifre,
      String sifretekrar, BuildContext context) {
    List<double> _konum = [0.0, 0.0];
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: sifretekrar)
        .then((value) {
      FirebaseFirestore.instance
          .collection("users")
          .doc(email)
          .set(UserClass(isim, email, tel, _konum).toMap());
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (context) => MyHomePage()));
    });
  }
}
