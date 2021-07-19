
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:final_test/models/database.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import '../../models/authentication.dart';


class UploadFile extends StatefulWidget {
  UploadFileS createState()=>  UploadFileS();
  }

class UploadFileS extends State<UploadFile> {

  File? file;
  final _formKey = GlobalKey<FormState>();
  final Authentication _auth = Authentication();
  UploadTask? task;
  late String _extension;
  bool _multiPick = false;
  var _pickType;
  late Map<String, String> _paths;
  late String _path;
  @override
  Widget build(BuildContext context) {
    final String fileName =
    file != null ? (file!.path) : "No File Selected";
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


                           child:new DropdownButton<dynamic>(
                            hint: new Text('Select'),
                            value: _pickType,
                            items: <DropdownMenuItem>[
                            new DropdownMenuItem(
                            child: new Text('Image'),
                                value: ".png"
                            ),
                            new DropdownMenuItem(
                            child: new Text('pdf'),
                                value: ".pdf"
                            ),
                              new DropdownMenuItem(
                                  child: new Text('Audio'),
                                  value: ".mp3"
                              ),
                              new DropdownMenuItem(
                                  child: new Text('document'),
                                  value: ".docx"
                              ),
                            new DropdownMenuItem(
                            child: new Text('powerpoint'),
                                value: ".pptx"
                            ),
                            ],
                            onChanged: (newvalue) => setState(() {
                            _pickType = newvalue;
                            }),
                  )
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

                                upload(fileName);
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

  Future upload(fileName) async {

    final fileType = extension(file!.path);
    if (_pickType != null && fileType == _pickType) {
      final destination = (fileType);
      task = database.uploadFile(
          destination, file!);
      setState(() {});

     } else if ( fileType != _pickType!) {
   print('mm');
  }
  }


  }





