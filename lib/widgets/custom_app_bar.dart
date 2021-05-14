import 'package:flutter/material.dart';

Widget customAppBar() {
  return AppBar(
    backgroundColor: Colors.white,
    centerTitle: true,
    elevation: 0.0,
    title: Text.rich(
      TextSpan(
        text: 'News ',
        style: TextStyle(color: Colors.black),
        children: <TextSpan>[
          TextSpan(text: 'App', style: TextStyle(color: Colors.amberAccent))
        ],
      ),
    ),
  );
}
