import 'package:hairy_tail/constants/berber_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddBerber {
  final Berber berber;

  AddBerber(this.berber) {
    CollectionReference berbers =
        FirebaseFirestore.instance.collection('berbers');

    Future<void> addBerber() {
      // Call the user's CollectionReference to add a new user
      return berbers
          .doc(berber.getEmail)
          .set(berber.toMap())
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    addBerber();
  }
}
