import 'dart:convert';

class Comment {
  final String _to;
  final String _comment;
  final String _from;

  Comment(
    this._to,
    this._comment,
    this._from,
  );

  Comment copyWith(
    String _to,
    String _comment,
    String _from,
  ) {
    return Comment(
      _to ?? this._to,
      _comment ?? this._comment,
      _from ?? this._from,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      '_to': _to,
      '_comment': _comment,
      '_from': _from,
    };
  }

  factory Comment.fromMap(Map<String, dynamic> map) {
    if (map == null) return null;

    return Comment(
      map['_to'],
      map['_comment'],
      map['_from'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Comment.fromJson(String source) =>
      Comment.fromMap(json.decode(source));

  @override
  String toString() => 'Comment(_to: $_to, _comment: $_comment, _from: $_from)';

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is Comment &&
        o._to == _to &&
        o._comment == _comment &&
        o._from == _from;
  }

  @override
  int get hashCode => _to.hashCode ^ _comment.hashCode ^ _from.hashCode;
}
