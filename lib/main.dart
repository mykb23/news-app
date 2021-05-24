import 'package:news_app/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: App(),
  ));
}

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 5), () {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomeScreen()));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text.rich(
          TextSpan(
            text: 'News ',
            style: TextStyle(color: Colors.black, fontSize: 80.0),
            children: <TextSpan>[
              TextSpan(text: 'App', style: TextStyle(color: Colors.amberAccent))
            ],
          ),
        ),
      ),
    );
  }
}
