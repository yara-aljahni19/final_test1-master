
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/authentication.dart';

var assetImage6 = AssetImage('assets/image6.png');
var image6 = Image(
  image: assetImage6,
  height: 200,
  width: 420.0,
);
// Welcome page //
class Welcome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFE8FFFF),
        appBar: AppBar(
          title: Text('first app'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
                child: Text('                 Thank you ! ',
                    style: TextStyle(
                        height: 13, color: Colors.black, fontSize: 25))),
            image6,
            Container(
                child: Text('             Now, welcome to our beautiful app.',
                    style: TextStyle(height: 27.5, color: Colors.grey))),
            // let's go button
            Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new RaisedButton(
                    child: new Text("Let's go"),
                    onPressed: () {
                    }),
                Container(height: 80.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

