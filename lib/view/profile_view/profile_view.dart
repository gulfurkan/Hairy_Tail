import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hairy_tail/constants/user_class.dart';
import 'package:hairy_tail/widgets/text_box/my_text_field.dart';

class ProfileViev extends StatelessWidget {
  final UserClass user;
  const ProfileViev({Key key, this.user}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    String name = "Username";
    String number = "Number";
    return Scaffold(
        backgroundColor: Colors.grey[100],
        appBar: AppBar(
          backgroundColor: Colors.pink,
          title: Text("Profile Settings"),
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Container(
            padding: EdgeInsets.only(left: 16, top: 25, right: 16),
            child: ListView(
              children: [
                SizedBox(
                  height: 15,
                ),
                Center(
                  child: Stack(
                    children: [
                      Container(
                        width: 130,
                        height: 130,
                        decoration: BoxDecoration(
                            border: Border.all(
                              width: 4,
                              color: Theme.of(context).scaffoldBackgroundColor,
                            ),
                            boxShadow: [
                              BoxShadow(
                                spreadRadius: 2,
                                blurRadius: 10,
                                color: Colors.black.withOpacity(0.1),
                                offset: Offset(0, 10),
                              )
                            ],
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage("assets/images/acc.png"),
                            )),
                      )
                    ],
                  ),
                ),
                Column(
                  children: [
                    MyTextField(name, Icon(Icons.account_circle_rounded), true),
                    SizedBox(
                      height: 35,
                    ),
                    MyTextField(number, Icon(Icons.local_phone), true),
                    SizedBox(
                      height: 35,
                    ),
                    RaisedButton(
                      onPressed: () {},
                      color: Colors.green,
                      elevation: 2,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                      child: Text(
                        "Kaydet",
                        style: TextStyle(
                            fontSize: 14,
                            letterSpacing: 2.2,
                            color: Colors.white),
                      ),
                    )
                  ],
                ),
              ],
            )));
  }
}
