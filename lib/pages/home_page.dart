import 'package:flutter/material.dart';
import 'package:random_string/random_string.dart' as random;

class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
      ),
      body: Container(
        child: Center(
          child: Text(
            random.randomAlphaNumeric(20),
            style: TextStyle(color: Colors.black54, fontSize: 20.0),
          ),
        ),
      ),
    );
  }
}
