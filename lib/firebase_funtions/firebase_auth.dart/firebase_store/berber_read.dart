import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:hairy_tail/constants/berber_class.dart';

class ReadBerber {
  List<Berber> berbers = [];
  ReadBerber() {
    FirebaseFirestore.instance
        .collection('berbers')
        .get()
        .then((QuerySnapshot querySnapshot) => {
              querySnapshot.docs.forEach((doc) {
                berbers.add(Berber.fromMap(doc.data()));
              })
            });
  }
  Future<List<Berber>> getBerbers() async => berbers;
  /*[
        Berber("_isim", "_aciklama", "_email", "_numara", "_adres", 0, [1, 1])
      ];*/
}
