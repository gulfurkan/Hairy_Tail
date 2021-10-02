import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hairy_tail/constants/user_class.dart';
import 'package:hairy_tail/firebase_funtions/firebase_auth.dart/firebase_store/add_user.dart';
import 'package:hairy_tail/view/home/user_homePage.dart';

import 'package:hairy_tail/widgets/text_box/text_box.dart';

class CreateAccount extends StatelessWidget {
  const CreateAccount({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<TextBox> textbox = [
      TextBox("email", "ornek@email.com"),
      TextBox("şifre", "örnekşifre"),
      TextBox("isim", "leonardo"),
      TextBox("telefon", "123456798"),
    ];
    return Container(
        child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          children: textbox,
        ),
        RaisedButton(onPressed: () => _create(textbox, context))
      ],
    ));
  }

  createAc(List<TextBox> textbox, List<double> pos, BuildContext context) {
    FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

    try {
      if (_firebaseAuth.currentUser == null &&
          textbox[0].getText().length > 0) {
        _firebaseAuth.createUserWithEmailAndPassword(
            email: textbox[0].getText(), password: textbox[1].getText());
        AddUser(UserClass(textbox[2].getText(), textbox[0].getText(),
            textbox[3].getText(), pos));
        print("kayıt başarılı");
        if (_firebaseAuth.currentUser != null) {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => MyHomePage(
                        title: "tıklama",
                      )));
        }
      }
      if (_firebaseAuth.currentUser != null) {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => MyHomePage(
                      title: "tıklama",
                    )));
      }
    } on FirebaseAuthException catch (e) {
      print(e.message);
    }
  }

  Future<dynamic> _create(List<TextBox> textbox, BuildContext context) async {
    return await createAc(textbox, [0.0, 0.0], context);
  }
}
