import 'package:flutter/material.dart';

class TextTitle1 extends StatelessWidget {
  String title;

  var color;

  TextTitle1({Key? key, required this.title, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold, color: color),
    );
  }
}

class TextTitle2 extends StatelessWidget {
  String title;

  var color;

  TextTitle2({Key? key, required this.title, this.color = Colors.black})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style:
          TextStyle(fontSize: 22.0, fontWeight: FontWeight.bold, color: color),
    );
  }
}
