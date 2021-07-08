
import 'package:final_test/Screen/Welcome.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../../models/authentication.dart';
import 'Reset.dart';

class LogInS extends StatefulWidget {
  @override
  LogIn createState() => LogIn();
}

class LogIn extends State<LogInS> {

  final _formKey = GlobalKey<FormState>();
  final Authentication _auth = Authentication();
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Scaffold(
          backgroundColor: Color(0xFFE8FFFF),
          appBar: AppBar(
            title: Text('LogIn'),
          ),
         resizeToAvoidBottomInset: false,
          body: Stack(children: [


                Container(

                    child: Text('                                     Login Now ',
                        style: TextStyle(height: 2, color: Colors.grey))),
                Container(
                    child: Text(
                        '               Please login to continue using our app. ',
                        style: TextStyle(height: 5, color: Colors.grey))),



                Expanded(
                      child: Text('                          or login with email',
                          style: TextStyle(height: 18, color: Colors.grey)),
                ),


             Container(
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.end,
               children: [

              new RaisedButton(
                onPressed: () async {
                  try{
                    await _auth.signInWithFacebook();
                  } on FirebaseAuthException catch (error) {
                    print(error);
                  }
                  },

                  color:Colors.indigo,
                padding: EdgeInsets.symmetric(
                  horizontal: 20.0,
                  vertical: 10.0,
                ),
                  shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0)),
                  child: new Text('Facebook',
                      style: new TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                          fontWeight: FontWeight.bold)),

                ),
                     Container(height: 340.0 , width: 450 ,),
                ],

               )
            ),

                Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        new RaisedButton(
                          onPressed: () async {
                            try{
                               await _auth.signInWithGoogle(); {

                               }

                            } on FirebaseAuthException catch (error) {
                              print(error);
                            }
                          },

                          color:Colors.red,
                          padding: EdgeInsets.symmetric(
                            horizontal:26.0,
                            vertical: 10.0,
                          ),
                          shape: new RoundedRectangleBorder(
                              borderRadius: new BorderRadius.circular(30.0)),
                          child: new Text('Google',
                              style: new TextStyle(
                                  color: Colors.white,
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold)),

                        ),
                        Container(height: 290.0 , width: 450.0,),
                      ],

                    )
                ),

                //username textfield
                Container(
                  child: Form(
                    key: _formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextField(
                          controller: _nameController,
                          decoration: InputDecoration(
                            labelText: "        UserName :",
                            labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                          ),
                        ),
                        Container(height: 210.0),
                      ],
                    ),
                  ),
                ),
                //email textfield
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                     TextField(
                        controller: _emailContoller,
                        decoration: InputDecoration(
                          labelText: "        Email  :",
                          labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),

                      Container(height: 160.0),

                    ],
                  ),
                ),

                //password textfield
                Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextField(
                        controller: _passwordController,
                        decoration: InputDecoration(
                          labelText: "        Password  :",
                          labelStyle: TextStyle(fontSize: 14, color: Colors.grey),
                        ),
                      ),
                      Container(height: 120.0),
                    ],
                  ),
                ),
                // login button
                new Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    new RaisedButton(
                      elevation: 0.0,
                      child: new Text(" Log in"),
                      onPressed: () async {
                   try {
                     dynamic result = await _auth.loginUser(_nameController.text, _emailContoller.text, _passwordController.text);
                     if(result != null){
                       Navigator.push(
                         context,
                         MaterialPageRoute(builder: (context) => (Welcome())),
                       );

                     }if(result == null){
                       _showAlertDialog('error message','there is no user with this record');
                       return;
                     }

                        }  catch (error) {


                   }
                      }

                   )
                    ,
                    Container
                      (
                        height: 55.0
                    )
                    ,
                  ]
                  ,
                )
                ,
                new
                Column
                  (
                  mainAxisAlignment: MainAxisAlignment.end, children: <
                    Widget>[
                  new
                  RaisedButton
                    (
                    elevation: 0.0
                    ,
                    child: new
                    Text
                      (" Reset password"),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => (Reset())),
                      );
                    },
                  )
                  ,
                  Container
                    (
                      height: 15.0),
                ],
                ),
              ]
              )

          ,
        ),
    );

  }
  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
        context: context,
        builder: (_) => alertDialog
    );
  }

}



