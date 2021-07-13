
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:final_test/models/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../../models/authentication.dart';


class UploadFile extends StatefulWidget {
  UploadFileS createState()=>  UploadFileS();
  }

class UploadFileS extends State<UploadFile> {


  final _formKey = GlobalKey<FormState>();
  final Authentication _auth = Authentication();
  UploadTask? task;
  File? file;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
            backgroundColor: Color(0xFFE8FFFF),
            appBar: AppBar(
              title: Text('Upload File'),
            ),
            resizeToAvoidBottomInset: false,
            body: Stack(
                children: <Widget>[


                  Container(
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            TextFormField(
                              decoration: InputDecoration(
                                labelText: "        File Name :",
                                labelStyle:
                                TextStyle(fontSize: 15, color: Colors.black),
                              ),
                            ),
                            SizedBox(height: 310.0),
                          ]
                      )
                  ),

                  new Text('         File Type :   ',
                      style: TextStyle(
                          height: 14, fontSize: 15, color: Colors.black)),


                  Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                130.0, 2.0, 0.0, 160.0),
                            child: DropdownButton<String>(

                              items: <String>['docx', 'pdf', 'png'].map((
                                  String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},

                            ),
                          ),


                        ]
                    ),

                  ),
                  new Text('      File Category :   ',
                      style: TextStyle(
                          height: 19, fontSize: 15, color: Colors.black)),


                  Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(
                                130.0, 2.0, 0.0, 40.0),
                            child: DropdownButton<String>(

                              items: <String>['image', 'document', 'memory']
                                  .map((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: new Text(value),
                                );
                              }).toList(),
                              onChanged: (_) {},

                            ),
                          ),


                        ]
                    ),

                  ),

                  new Text('            File  :   ',
                      style: TextStyle(
                          height: 24, fontSize: 15, color: Colors.black)),

                  Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          new RaisedButton(
                              child: new Text(" Select file"),
                              onPressed: () {
                                select();
                              }
                          ),
                          Container(height: 150.0),
                        ]
                    ),
                  ),

                  Container(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [

                          new RaisedButton(
                              child: new Text(" Upload"),
                              onPressed: () {
                                try{

                                    if (file == null) {
                                      _showAlertDialog('error message','there is no file to upload');
    }
                                    else {
                                      final fileName = (file!.path);
                                      final destination = (fileName);
                                      task = database.uploadFile(
                                          destination, file!);
                                      setState(() {});
                                      _showAlertDialog('success message','file is uploaded successfuly');
                                    }

                                }catch (error) {

                                }

                              }
                          ),
                          Container(height: 35.0),
                        ]
                    ),
                  ),

                ]
            )));
  }

  Future select() async {

    final result = await FilePicker.platform.pickFiles(allowMultiple: false);

    if (result == null) return;

    final path = result.files.single.path!;

    setState(() => file = File(path));
  }


  void _showAlertDialog(String title, String message) {

    AlertDialog alertDialog = AlertDialog(
      title: Text(title),
      content: Text(message),
    );
    showDialog(
       context: context,
        builder: (_) => alertDialog ,

    );
  }


}



