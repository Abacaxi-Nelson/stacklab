import 'package:flutter/material.dart';

class AppBarTitle extends StatelessWidget {
  AppBarTitle({@required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Text(title,
        style: TextStyle(
            fontSize: 14.0,
            fontWeight: FontWeight.normal,
            color: Colors.white));
  }
}
