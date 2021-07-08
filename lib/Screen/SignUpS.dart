


import 'package:final_test/Screen/Confirm.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import '../../models/authentication.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:encrypt/encrypt.dart';




class SignUpS extends StatefulWidget {
  @override
   SignUp createState() =>SignUp();
}

class SignUp extends State<SignUpS> {

// Create a global key that identifies the Form widget
  final _formKey = GlobalKey<FormState>();

  final Authentication _auth =Authentication();

  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailContoller = TextEditingController();
  TextEditingController _passwordController = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Color(0xFFE8FFFF),
          appBar: AppBar(
            title: Text('first app'),
          ),
          resizeToAvoidBottomInset: false,
          body: Stack(
            children: <Widget>[
              Container(
                  child: Text('                                     Sign Up ',
                      style: TextStyle(height: 2, color: Colors.grey))),
              Container(
                  child: Text('               Please sign up to enter in a app ',
                      style: TextStyle(height: 5, color: Colors.grey))),
              Container(
                  child: Text('                  Enter via social networks ',
                      style:
                      TextStyle(height: 7, color: Colors.grey, fontSize: 15))),
              Container(
                  child: Center(
                    //form widget
                    child: Form(
                        key: _formKey,
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              //name_textfield
                              TextFormField(
                                controller:_nameController ,
                                decoration: InputDecoration(
                                  labelText: "        UserName :",
                                  labelStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                                //uncomplemnt condition
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'This field is empty';
                                  }

                                  return null;
                                },
                              ),

                              SizedBox(height: 14),

                              //email_textfield
                              TextFormField(
                                controller:  _emailContoller ,
                                decoration: InputDecoration(
                                  labelText: "        Email  :",
                                  labelStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                                //empty-cond
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter your email address';
                                  }
                                  //reg-cond
                                  if (!RegExp(r'\S+@\S+\.\S+').hasMatch(value)) {
                                    return 'Please enter a valid email address';
                                  }

                                  return null;
                                },
                              ),

                              SizedBox(height: 14),
                              //password_textfield
                              TextFormField(
                                controller: _passwordController ,
                                decoration: InputDecoration(
                                  labelText: "        Password  :",
                                  labelStyle:
                                  TextStyle(fontSize: 14, color: Colors.grey),
                                ),
                                //leng-cond
                                obscureText: true,
                                validator: (value)  {
                                  if (value!.trim().length < 8) {
                                    return 'Password must be at least 8 characters in length';


                                  }
                                  return null;
                                },
                              ),
                              SizedBox(height: 14),

                              new Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: <Widget>[
                                    Container(
                                      //signup_button
                                      child: RaisedButton(
                                          child: Text('Sign Up'),
                                          // if the state is validate go to login page
                                          onPressed: () async {

                                            if (_formKey.currentState!.validate()) {

                                                 try {
                            dynamic result = await _auth.createNewUser(_nameController.text, _emailContoller.text, _passwordController.text);
                                                   if(result!=null) {
                                                     Navigator.push(
                                                       context,
                                                       MaterialPageRoute(builder: (context) => (Confirm())),
                                                     );
                                                   }
                                                 }catch(error){
                                                  print(error);
                                                         }
                                            }

                                          }
                                          ),
                                    )
                                  ])
                            ])),
                  ))
            ],
          ),
        ));
  }
}