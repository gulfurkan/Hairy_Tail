import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

// ignore: must_be_immutable
class StarDisplay extends StatefulWidget {
  int value = 0;
  final ValueSetter<int> callback;
  StarDisplay({this.callback});
  @override
  State<StatefulWidget> createState() {
    return Star();
  }
}

class Star extends State<StarDisplay> {
  @override
  Widget build(BuildContext context) {
    widget.callback(widget.value);
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return ButtonTheme(
          minWidth: MediaQuery.of(context).size.width / 8,
          child: FlatButton(
            onPressed: () {
              setState(() {
                widget.value = index;
              });
            },
            child: Icon(
              index <= widget.value ? Icons.star : Icons.star_border,
              color: Colors.yellow,
              size: 35,
            ),
          ),
        );
      }),
    );
  }
}


/*ButtonTheme(
          minWidth: MediaQuery.of(context).size.width / 8,
          child: RaisedButton(
            onPressed: () {
              setState(() {
                widget.value=index;
              });
            },
            child: Icon(index <= widget.value ? Icons.star : Icons.star_border,color: Colors.yellow,),
          ),
        );*/