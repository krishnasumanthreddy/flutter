import 'package:flutter/material.dart';

import 'package:emfa/blotter.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return SingleChildScrollView(
      child: Container(
        margin: const EdgeInsets.all(30.0),
        padding: const EdgeInsets.all(20.0),
        decoration:
            new BoxDecoration(border: new Border.all(color: Colors.blueAccent)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            Row(
              children: <Widget>[
                Text("UserName:"),
                Expanded(
                  child: TextField(),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Row(
              children: <Widget>[
                Text("Password:"),
                Expanded(
                  child: TextField(),
                )
              ],
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
            ),
            Container(
              child: RaisedButton(
                child: Text("Login"),
                onPressed: () {
                  Navigator.push(
                      context,
                      new MaterialPageRoute(
                          builder: (context) => new Blotter()));
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}
