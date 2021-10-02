import 'package:hairy_tail/constants/user_class.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddUser {
  final UserClass userClass;

  AddUser(this.userClass) {
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    Future<void> addUser() {
      // Call the user's CollectionReference to add a new user
      return users
          .doc(userClass.toMap()["_email"])
          .set(userClass.toMap())
          .then((value) => print("User Added"))
          .catchError((error) => print("Failed to add user: $error"));
    }

    addUser();
  }
}
