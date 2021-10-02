import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hairy_tail/constants/berber_class.dart';
import 'package:hairy_tail/main.dart';
import 'package:hairy_tail/view/favorities_view/favorities_view.dart';
import 'package:hairy_tail/view/home/user_home_view.dart';
import 'package:hairy_tail/view/profile_view/profile_view.dart';

import 'drawer_header.dart';

class DrawerWidget extends StatelessWidget {
  const DrawerWidget({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Container(
            child: ListView(
      padding: EdgeInsets.zero,
      children: [
        DrawerHeader(
          child: Text("Menu"),
          decoration: BoxDecoration(
            color: Colors.pink,
          ),
        ),
        Column(
          children: [
            Divider(
              color: Colors.red,
            ),
            ListTile(
              leading: Image.asset("assets/images/acc.png"),
              title: Text("Profile Settings"),
              onTap: () {
                //yaz aga
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProfileViev()));
              },
            ),
            Divider(
              color: Colors.red,
            ),
            ListTile(
              leading: Image.asset("assets/images/fav.png"),
              title: Text("Favorites"),
              onTap: () {
                //yaz aga
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => FavoritesView()));
              },
            ),
            Divider(
              color: Colors.red,
            ),
            ListTile(
              leading: Image.asset("assets/images/settings.png"),
              title: Text("Settings"),
              onTap: () {
                //yaz aga
              },
            ),
            Divider(
              color: Colors.red,
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text("Logout"),
              onTap: () {
                FirebaseAuth.instance.signOut().then((value) => Navigator.push(
                    context, MaterialPageRoute(builder: (context) => MyApp())));
              },
            ),
            Divider(
              color: Colors.red,
            ),
          ],
        ),
      ],
    )));
  }
}
