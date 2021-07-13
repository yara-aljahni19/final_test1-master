

import 'package:final_test/Screen/Confirm.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'SignUpS.dart';
import 'LogInS.dart';
import 'Reset.dart';
import 'UploadFile.dart';
import 'Welcome.dart';
import '../../models/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MaterialApp(
    title: 'first app',
    home: UploadFile (),
  ));
}

//img_path
var assetImage = AssetImage('assets/image1.jpg');
var image = Image(
  image: assetImage,
  height: 250,
  width: 400.0,
);

var assetImage1 = AssetImage('assets/image2.png');
var image1 = Image(
  image: assetImage1,
  height: 270,
  width: 100.0,
);

var assetImage2 = AssetImage('assets/image3.png');
var image2 = Image(
  image: assetImage2,
  height: 270,
  width: 100.0,
);

var assetImage3 = AssetImage('assets/image4.png');
var image3 = Image(
  image: assetImage3,
  height: 270,
  width: 100.0,
);



//home page
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFE8FFFF),
        appBar: AppBar(
          title: Text('first app'),
        ),
        body: Stack(children: <Widget>[
          Container(
              child: Text('                                     Welcome ',
                  style: TextStyle(height: 2, color: Colors.grey))),
          image,
          Container(
              child: Text(
                  '  Please login or sign up to continue using our app.',
                  style: TextStyle(height: 23, color: Colors.grey))),
          //signup_button
          Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new RaisedButton(
                  child: new Text("Sign up"),
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => (SignUpS())),
                    );
                  }
                  ),
              Container(height: 120.0),
            ],
          ),
          //login_button
          new Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              new RaisedButton(
                elevation: 0.0,
                child: new Text(" Log in"),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => (LogInS())),
                  );
                },
              ),
              Container(height: 70.0),
            ],
          ),
        ]),
      ),
    );
  }
}

