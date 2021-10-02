import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:hairy_tail/constants/berber_class.dart';
import 'package:hairy_tail/constants/user_class.dart';
import 'package:hairy_tail/firebase_funtions/firebase_auth.dart/firebase_store/comment_type.dart';
import 'package:hairy_tail/firebase_funtions/firebase_auth.dart/firebase_store/favorite.dart';
import 'package:hairy_tail/widgets/berber_detail_widgets/star_display.dart';

class BerberDetails extends StatefulWidget {
  final Berber berber;
  BerberDetails(this.berber);
  String email = FirebaseAuth.instance.currentUser.email;
  bool isFav = false;

  @override
  _BerberDetailsState createState() => _BerberDetailsState();
}

class _BerberDetailsState extends State<BerberDetails> {
  var myController =
      PageController(initialPage: 0, keepPage: true, viewportFraction: 1);
  bool page = false;
  List<Comment> comments = [];
  var txtController = TextEditingController();
  int star = 0;

  @override
  Widget build(BuildContext context) {
    favCeck();
    return FutureBuilder<QuerySnapshot>(
        future: FirebaseFirestore.instance.collection('comments').get(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            comments.clear();
            try {
              snapshot.data.docs
                  .where((element) =>
                      (element.data() as Map<String, dynamic>)["_to"] ==
                      widget.berber.getEmail)
                  .forEach((element) {
                comments.add(Comment.fromMap(element.data()));
              });
              print("comments len ${comments.length}");
            } on Exception catch (e) {
              print(e);
            }
          }
          return Scaffold(
            backgroundColor: Colors.grey[100],
            appBar: AppBar(
              backgroundColor: Colors.pink,
              toolbarHeight: 50,
              title: Text("Profil"),
            ),
            body: Column(
              children: [
                SizedBox(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height / 4,
                  child: Container(
                    color: Colors.grey[100],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          child: Image.asset('assets/images/acc.png'),
                          width: MediaQuery.of(context).size.width / 3,
                          height: double.infinity,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 2 / 3,
                          height: double.infinity,
                          child: Text(
                            "Description :${widget.berber.toMap()["_aciklama"]}\n\nAddress :${widget.berber.toMap()["_adres"]}\n\n Point: ${widget.berber.getCardElements[2]}",
                            textAlign: TextAlign.start,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 500,
                  height: 50,
                  child: Container(
                    //color: Colors.pink[50],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonTheme(
                          buttonColor: Colors.grey[200],
                          minWidth: MediaQuery.of(context).size.width / 6,
                          height: 100.0,
                          child: RaisedButton(
                            onPressed: () {
                              showDialog(
                                  context: context,
                                  builder: (BuildContext context) => Dialog(
                                      backgroundColor: Colors.transparent,
                                      insetPadding: EdgeInsets.all(10),
                                      child: Stack(
                                        //overflow: Overflow.visible,
                                        alignment: Alignment.center,
                                        children: <Widget>[
                                          Container(
                                            width: double.infinity,
                                            height: 300,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                                color: Colors.pinkAccent),
                                            padding: EdgeInsets.fromLTRB(
                                                20, 50, 20, 20),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                TextField(
                                                  controller: txtController,
                                                ),
                                                StarDisplay(
                                                  callback: (i) {
                                                    star = i + 1;
                                                  },
                                                ),
                                                ButtonTheme(
                                                  height: 30.0,
                                                  child: FlatButton(
                                                    onPressed: () {
                                                      setState(() {
                                                        yorumyap(
                                                            txtController.text,
                                                            star.toDouble());
                                                        txtController.clear();
                                                      });
                                                      Navigator.pop(context);
                                                    },
                                                    child: Icon(
                                                      Icons.add_comment,
                                                      size: 40,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )));
                            },
                            child: Icon(Icons.mode_comment),
                          ),
                        ),
                        ButtonTheme(
                          buttonColor: Colors.grey[200],
                          minWidth: MediaQuery.of(context).size.width / 6,
                          height: 100.0,
                          child: RaisedButton(
                            onPressed: () {
                              widget.isFav ? favorinesil() : favorineekle();
                            },
                            child: Icon(
                              widget.isFav
                                  ? Icons.favorite
                                  : Icons.favorite_border,
                              color: Colors.red,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  width: 500,
                  height: 50,
                  child: Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ButtonTheme(
                          buttonColor: !page ? Colors.pink : Colors.grey[100],
                          minWidth: MediaQuery.of(context).size.width / 6,
                          height: 100.0,
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                myController.jumpToPage(0);
                                page = false;
                              });
                            },
                            child: Icon(Icons.money),
                          ),
                        ),
                        ButtonTheme(
                          buttonColor: page ? Colors.pink : Colors.grey[100],
                          minWidth: MediaQuery.of(context).size.width / 6,
                          height: 100.0,
                          child: RaisedButton(
                            onPressed: () {
                              setState(() {
                                myController.jumpToPage(1);
                                page = true;
                              });
                            },
                            child: Icon(Icons.mode_comment),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: PageView(
                    scrollDirection: Axis.horizontal,
                    controller: myController,
                    pageSnapping: true,
                    onPageChanged: (index) {
                      setState(() {
                        page = !page;
                      });
                    },
                    children: [
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            color: index % 2 == 0
                                ? Colors.grey[300]
                                : Colors.grey[400],
                            child: ListTile(
                              leading: Icon(Icons.whatshot_rounded),
                              title: Text(widget.berber.getServices.keys
                                  .elementAt(index)),
                              subtitle: Text(widget.berber.getServices.keys
                                      .elementAt(index) +
                                  " description"),
                              trailing: Text(widget.berber.getServices.values
                                      .elementAt(index)
                                      .toString() +
                                  "₺"),
                            ),
                          );
                        },
                        itemCount: widget.berber.getServices.length,
                      ),
                      ListView.builder(
                        itemBuilder: (context, index) {
                          return Card(
                            color: index % 2 == 0
                                ? Colors.grey[300]
                                : Colors.grey[400],
                            child: ListTile(
                              leading: Icon(Icons.comment),
                              title: Text(comments
                                  .elementAt(index)
                                  .toMap()["_from"]
                                  .toString()),
                              subtitle: Text(comments
                                  .elementAt(index)
                                  .toMap()["_comment"]
                                  .toString()),
                            ),
                          );
                        },
                        itemCount: comments.length,
                      ),
                    ],
                  ),
                )
              ],
            ),
          );
        });
  }

  void favCeck() {
    FirebaseFirestore.instance
        .collection("favorities")
        .doc(widget.berber.getEmail + widget.email)
        .get()
        .then((value) =>
            value.exists ? widget.isFav = true : widget.isFav = false);
  }

  yorumyap(String cmnt, double point) {
    print("point: $point");
    point = (widget.berber.getCardElements[2] * comments.length + point) /
        (comments.length + 1);
    print("widget: ${widget.berber.getCardElements[2]}");
    // print(comments.length);
    String usr;
    setState(() {
      FirebaseFirestore.instance
          .collection("users")
          .doc(widget.email)
          .get()
          .then((value) {
        FirebaseFirestore.instance.collection("comments").add(Comment(
                widget.berber.getEmail,
                cmnt,
                UserClass.fromMap(value.data()).getName)
            .toMap());
        usr = UserClass.fromMap(value.data()).getName;
      });
      widget.berber.setPoint(point);
      FirebaseFirestore.instance
          .collection("berbers")
          .doc(widget.berber.getEmail)
          .set(widget.berber.toMap());
      comments.add(Comment(widget.berber.getEmail, cmnt, usr));
    });
  }

  void favorineekle() {
    setState(() {
      FirebaseFirestore.instance
          .collection("favorities")
          .doc(widget.berber.getEmail + widget.email)
          .set(Favorite(widget.email, widget.berber.getEmail).toMap())
          .whenComplete(() => widget.isFav = true);
    });
  }

  void favorinesil() {
    setState(() {
      FirebaseFirestore.instance
          .collection("favorities")
          .doc(widget.berber.getEmail + widget.email)
          .delete()
          .whenComplete(() => widget.isFav = false);
    });
  }
}
