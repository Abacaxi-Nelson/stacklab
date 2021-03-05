import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  CustomButton({@required this.onPressed, @required this.title});
  final Function onPressed;
  final String title;

  @override
  Widget build(BuildContext context) {
    return FlatButton(
      onPressed: onPressed,
      child: Text(title, style: TextStyle(color: Colors.white, fontSize: 14)),
      textColor: Colors.white,
      shape: RoundedRectangleBorder(
          side: BorderSide(
              color: Colors.white, width: 1, style: BorderStyle.solid),
          borderRadius: BorderRadius.circular(10)),
    );
  }
}
