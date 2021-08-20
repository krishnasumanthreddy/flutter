import 'package:flutter/material.dart';
import 'package:emfa/blotter.dart';
import 'package:emfa/login.dart';



void main() => runApp(OMS());

class OMS extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('OMS'),
        ),
        body: Login(),
      ),
    );
  }
}
