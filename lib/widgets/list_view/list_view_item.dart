import 'package:flutter/material.dart';
import 'package:hairy_tail/constants/berber_class.dart';
import 'package:hairy_tail/view/berber_details/berber_details.dart';

class ListViewItem extends StatefulWidget {
  final Image _icon;
  final Berber _berber;
  final List<double> _pos;
  final List<double> position = [0.0, 0.0];
  ListViewItem(this._berber, this._icon, this._pos);
  @override
  _ListViewItemState createState() => _ListViewItemState();
}

class _ListViewItemState extends State<ListViewItem> {
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => BerberDetails(widget._berber)));
      },
      leading: widget._icon,
      title: Text(widget._berber.getCardElements[0]),
      subtitle: Text(widget._berber.getCardElements[1]),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Text(widget._berber.getCardElements[2].toString()),
          Text(widget._berber.getCardElements[3].toString())
        ],
      ),
    );
  }
}
