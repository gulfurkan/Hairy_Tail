import 'dart:convert';

import 'package:flutter/foundation.dart';

class Berber {
  final String _isim;
  final String _aciklama;
  final String _email;
  final String _numara;
  final String _adres;
  double _point;
  final String _id;
  final List<double> _konum;
  final Map<String, int> services;
  Berber(
    this._isim,
    this._aciklama,
    this._email,
    this._numara,
    this._adres,
    this._point,
    this._id,
    this._konum,
    this.services,
  );
  List<dynamic> get getCardElements {
    return [_isim, _aciklama, _point, _adres];
  }

  String get getName {
    return _isim;
  }

  String get getEmail {
    return _email;
  }

  List<double> get getPosition {
    return _konum;
  }

  Map<String, int> get getServices {
    return services;
  }

  void setPoint(double point) {
    this._point = point;
  }

  Map<String, dynamic> toMap() {
    return {
      '_isim': _isim,
      '_aciklama': _aciklama,
      '_email': _email,
      '_numara': _numara,
      '_adres': _adres,
      '_point': _point,
      '_id': _id,
      '_konum': _konum,
      'services': services,
    };
  }

  Berber copyWith(
    String _isim,
    String _aciklama,
    String _email,
    String _numara,
    String _adres,
    double _point,
    String _id,
    List<double> _konum,
    Map<String, int> services,
  ) {
    return Berber(
      _isim ?? this._isim,
      _aciklama ?? this._aciklama,
      _email ?? this._email,
      _numara ?? this._numara,
      _adres ?? this._adres,
      _point ?? this._point,
      _id ?? this._id,
      _konum ?? this._konum,
      services ?? this.services,
    );
  }

  factory Berber.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Berber(
      map['_isim'],
      map['_aciklama'],
      map['_email'],
      map['_numara'],
      map['_adres'],
      map['_point'],
      map['_id'],
      List<double>.from(map['_konum']),
      Map<String, int>.from(map['services']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Berber.fromJson(String source) => Berber.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Berber(_isim: $_isim, _aciklama: $_aciklama, _email: $_email, _numara: $_numara, _adres: $_adres, _point: $_point, _id: $_id, _konum: $_konum, services: $services)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Berber &&
        o._isim == _isim &&
        o._aciklama == _aciklama &&
        o._email == _email &&
        o._numara == _numara &&
        o._adres == _adres &&
        o._point == _point &&
        o._id == _id &&
        listEquals(o._konum, _konum) &&
        mapEquals(o.services, services);
  }

  @override
  int get hashCode {
    return _isim.hashCode ^
        _aciklama.hashCode ^
        _email.hashCode ^
        _numara.hashCode ^
        _adres.hashCode ^
        _point.hashCode ^
        _id.hashCode ^
        _konum.hashCode ^
        services.hashCode;
  }
}
