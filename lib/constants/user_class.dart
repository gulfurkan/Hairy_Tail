import 'dart:convert';

import 'package:flutter/foundation.dart';

class UserClass {
  final String _isim;
  final String _email;
  final String _numara;
  final List<double> _konum;

  UserClass(
    this._isim,
    this._email,
    this._numara,
    this._konum,
  );
  String get getName {
    return _isim;
  }

  String get getNumber {
    return _numara;
  }

  List<double> get getPosition {
    return _konum;
  }

  Map<String, dynamic> toMap() {
    return {
      '_isim': _isim,
      '_email': _email,
      '_numara': _numara,
      '_konum': _konum,
    };
  }

  factory UserClass.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return UserClass(
      map['_isim'],
      map['_email'],
      map['_numara'],
      List<double>.from(map['_konum']),
    );
  }

  String toJson() => json.encode(toMap());

  factory UserClass.fromJson(String source) =>
      UserClass.fromMap(json.decode(source));

  @override
  String toString() {
    return 'User(_isim: $_isim, _email: $_email, _numara: $_numara, _konum: $_konum)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is UserClass &&
        o._isim == _isim &&
        o._email == _email &&
        o._numara == _numara &&
        listEquals(o._konum, _konum);
  }

  @override
  int get hashCode {
    return _isim.hashCode ^
        _email.hashCode ^
        _numara.hashCode ^
        _konum.hashCode;
  }
}
