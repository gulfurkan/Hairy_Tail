import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hairy_tail/constants/berber_class.dart';
import 'package:hairy_tail/constants/user_class.dart';
import 'package:hairy_tail/widgets/list_view/list_view_item.dart';

class UserHomePageView extends StatefulWidget {
  UserClass _userClass;
  String _userEmail;
  UserHomePageView() {
    _userEmail = FirebaseAuth.instance.currentUser.email;
    FirebaseFirestore.instance
        .collection("users")
        .doc(_userEmail)
        .get()
        .then((value) => _userClass = UserClass.fromMap(value.data()));
  }

  @override
  _UserHomePageViewState createState() => _UserHomePageViewState();
}

class _UserHomePageViewState extends State<UserHomePageView> {
  List<Berber> result = [];
  List<Berber> users = [];

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('berbers').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            users.clear();
            snapshot.data.docs.forEach((element) {
              users.add(Berber.fromMap(element.data()));
            });
          }
          return Container(
              color: Colors.grey[100],
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    automaticallyImplyLeading: false,
                    floating: true,
                    backgroundColor: Colors.grey[100],
                    flexibleSpace: Row(
                      children: [
                        Expanded(
                          child: Card(
                            elevation: 8,
                            margin: EdgeInsets.symmetric(
                                horizontal: 30, vertical: 30),
                            child: TextField(
                              onChanged: degistirildi,
                              decoration: InputDecoration(
                                prefixIcon: Icon(Icons.search),
                                hintText: ("Arama..."),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    expandedHeight: 100,
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Card(
                          elevation: 8,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(100),
                          ),
                          color: Colors.grey[200],
                          child: result.isEmpty
                              ? ListViewItem(
                                  users[index],
                                  Image.asset("assets/images/account.png"),
                                  users[index].getPosition)
                              : ListViewItem(
                                  result[index],
                                  Image.asset("assets/images/account.png"),
                                  result[index].getPosition)),
                      childCount: result.isEmpty ? users.length : result.length,
                    ),
                  )
                ],
              ));
        });
  }

  void degistirildi(String value) {
    setState(() {
      result.clear();
      for (int i = 0; i < users.length; i++) {
        if (users[i]
            .getCardElements[0]
            .toString()
            .toLowerCase()
            .contains(value.toLowerCase())) result.add(users[i]);
      }
    });
  }
}
