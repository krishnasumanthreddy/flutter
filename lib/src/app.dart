import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'ui/PlanetList.dart';

class App extends StatelessWidget
{
   @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home:Scaffold(
        body: PlanetList(),
      )
    );
  }
}
