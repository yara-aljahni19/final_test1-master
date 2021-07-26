import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import '../Screen/SignUpS.dart';
import '../Screen/LogInS.dart';
import '../../models/authentication.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class database {

  final CollectionReference List = FirebaseFirestore.instance.collection('User_Info');
  Future<void> createUserData(
      String name, String email, String password,String uid) async {

    return await List.doc(uid).set({'name': name, 'email':email, 'password':password});

  }




}