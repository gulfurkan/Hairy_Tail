import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hairy_tail/constants/berber_class.dart';
import 'package:hairy_tail/firebase_funtions/firebase_auth.dart/firebase_store/favorite.dart';
import 'package:hairy_tail/view/berber_details/berber_details.dart';
//import 'package:flutter_application_1/widgets/side_bar.dart';

// ignore: camel_case_types
class FavoritesView extends StatelessWidget {
  final List<dynamic> favs = [];
  List<Berber> berbers = [];

  String email;
  FavoritesView() {
    email = FirebaseAuth.instance.currentUser.email;
  }
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore.instance
        .collection("favorities")
        .where("_user", isEqualTo: email)
        .get()
        .then((value) => value.docs.forEach((element) {
              favs.add(Favorite.fromMap(element.data()).getBerber);
            }));
    return FutureBuilder<QuerySnapshot>(
      future: FirebaseFirestore.instance.collection("berbers").get(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          FirebaseFirestore.instance
              .collection("favorities")
              .where("_user", isEqualTo: email)
              .get()
              .then((value) => value.docs.forEach((element) {
                    favs.add(Favorite.fromMap(element.data()).getBerber);
                  }));
          print(snapshot.data.docs.length);
          snapshot.data.docs.forEach((element) {
            if (favs.contains(Berber.fromMap(element.data()).getEmail)) {
              berbers.add(Berber.fromMap(element.data()));
            }
          });
        }

        return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              backgroundColor: Colors.pink,
              title: Text("Favoriler"),
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
            body: Column(
              children: [
                Expanded(
                    child: ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            elevation: 8,
                            color: Colors.grey[100],
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(100),
                            ),
                            child: ListTile(
                              leading: Image.asset("assets/images/account.png"),
                              title: Text(berbers[index].getName),
                              subtitle: Text(berbers[index].getEmail),
                              onTap: () {
                                //yaz aga
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            BerberDetails(berbers[index])));
                              },
                            ),
                          );
                        },
                        itemCount: berbers.length)),
              ],
            ));
      },
    );
  }
}
