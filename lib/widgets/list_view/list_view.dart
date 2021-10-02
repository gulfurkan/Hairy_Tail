import 'package:flutter/material.dart';
import 'package:hairy_tail/constants/berber_class.dart';
import 'package:hairy_tail/constants/user_class.dart';
import 'package:hairy_tail/widgets/list_view/list_view_item.dart';

class ListViewWidget extends StatefulWidget {
  List<Berber> berberler;

  UserClass userClass;
  ListViewWidget(this.berberler, this.userClass);

  @override
  _ListViewWidgetState createState() => _ListViewWidgetState();
}

class _ListViewWidgetState extends State<ListViewWidget> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
