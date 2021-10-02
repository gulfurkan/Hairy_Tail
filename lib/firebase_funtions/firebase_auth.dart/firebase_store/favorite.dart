import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';

class Favorite {
  final String _user;
  final String _berber;
  Favorite(
    this._user,
    this._berber,
  );
  String get user {
    return _user;
  }

  Map<String, dynamic> toMap() {
    return {
      '_user': _user,
      '_berber': _berber,
    };
  }

  String get getUser {
    return _user;
  }

  String get getBerber {
    return _berber;
  }

  factory Favorite.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Favorite(
      map['_user'],
      map['_berber'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Favorite.fromJson(String source) =>
      Favorite.fromMap(json.decode(source));

  @override
  String toString() => 'Favorite(_user: $_user, _berber: $_berber)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Favorite && o._user == _user && o._berber == _berber;
  }

  @override
  int get hashCode => _user.hashCode ^ _berber.hashCode;
}

addFavs(Favorite fav) {
  FirebaseFirestore.instance.collection("Favorites").add(fav.toMap());
}
