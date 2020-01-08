import 'package:flutter/material.dart';

class UserPersonaWidget extends StatefulWidget {
  final String _persona;

  UserPersonaWidget(this._persona);

  @override
  _UserPersonaWidgetState createState() => _UserPersonaWidgetState();
}

class _UserPersonaWidgetState extends State<UserPersonaWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 16.0,vertical: 8.0),
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12.0),
          border: Border.all(
              color: Theme.of(context).accentColor,
              style: BorderStyle.solid,
              width: 2.0)),
      child: Text('${widget._persona}', style: TextStyle(fontSize: 36.0, fontWeight: FontWeight.w300)),
    );
  }
}
