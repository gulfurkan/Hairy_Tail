import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final String _string;
  const DrawerItem(
    Key key,
    this._string,
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(_string),
    );
  }
}
