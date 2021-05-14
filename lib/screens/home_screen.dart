import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          elevation: 0.0,
          title: Text.rich(
            TextSpan(
              text: 'News ',
              style: TextStyle(color: Colors.black),
              children: <TextSpan>[
                TextSpan(
                    text: 'App', style: TextStyle(color: Colors.amberAccent))
              ],
            ),
          ),
        ),
        body: Column(children: <Widget>[Text('Hi')]));
  }
}
