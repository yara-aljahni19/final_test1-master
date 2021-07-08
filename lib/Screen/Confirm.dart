import 'package:final_test/Screen/LogInS.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../models/authentication.dart';
import 'package:email_auth/email_auth.dart';
var assetImage8 = AssetImage('assets/confirm_img.png');
var confirm_img = Image(image: assetImage8);
// Reset page
class Confirm extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final Authentication _auth = Authentication();
  final String error1 = "user undefined ";
  TextEditingController _emailContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color(0xFFE8FFFF),
        appBar: AppBar(
          title: Text('Confirm page'),
        ),
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[

            Padding(
              padding: const EdgeInsets.only(
                  left: 90.0, top: 55.0, right: 90.0, bottom: 200.0),
              child: confirm_img,
            ),
            Container(
                child: Text('  A verification link has been sent to your email address  ',
                    style: TextStyle(
                        height: 21, color: Colors.black, fontSize: 15 ))),
            Container(
                child: Text('  check your email and click the link to continue  ',
                    style: TextStyle(
                        height: 23.5, color: Colors.black, fontSize: 15 ))),

                        Container(

                      child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                         new RaisedButton(

                          child: new Text(" login"),
                                onPressed: (){
                             Navigator.push(context, MaterialPageRoute(builder: (context) => (LogInS())),
    );
    }
                         ),
                                Container(height: 35.0),
              ],
            ),
        )
        ]
    )
       ));
  }
}