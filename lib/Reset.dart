
import 'package:final_test/LogInS.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../models/authentication.dart';

var assetImage5 = AssetImage('assets/image5.png');
var image5 = Image(image: assetImage5);
// Reset page
class Reset extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Authentication _auth = Authentication();
  TextEditingController _emailContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFE8FFFF),
        appBar: AppBar(
          title: Text('Reset password'),
        ),
        body: Stack(
          children: <Widget>[
            Container(
                child: Text('                                     Reset page ',
                    style: TextStyle(height: 2, color: Colors.grey))),
            Container(
                child: Text(
                    '                           forget your password ? ',
                    style: TextStyle(height: 4, color: Colors.grey))),
            Padding(
              padding: const EdgeInsets.only(
                  left: 90.0, top: 55.0, right: 90.0, bottom: 200.0),
              child: image5,
            ),
            Container(
                child: Text('    answer the question to reset your password ',
                    style: TextStyle(
                        height: 19, color: Colors.grey, fontSize: 15))),
            // security question textfield
            Container(

              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextField(
                    decoration: InputDecoration(
                      labelText:
                      "  In what city were you born? ",
                      labelStyle: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                  ),
                  Container(height: 165.0),
                ],
              ),
            ),

            // password textfield
            Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextField(
                    controller: _emailContoller,
                    decoration: InputDecoration(
                      labelText: "  email: ",
                      labelStyle: TextStyle(fontSize: 17, color: Colors.grey),
                    ),
                  ),
                  Container(height: 110.0),
                ],
              ),
            ),

            // reset button
            new Column(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                new RaisedButton(
                  elevation: 0.0,
                  child: new Text(" Reset password"),
                  onPressed: ()async {
                    try{
                      await _auth.sendPasswordResetEmail(_emailContoller.text);
                    } on FirebaseAuthException catch (error) {
                      print(error);
                    }
                  },
                ),
                Container(height: 25.0),
              ],
            ),
          ],
        ),
      ),
    );
  }
}