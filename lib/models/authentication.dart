
import 'package:final_test/database.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart';



class Authentication with ChangeNotifier {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future createNewUser(String name, String email, String password) async {
    try {
      UserCredential result = await _auth.createUserWithEmailAndPassword(
        email: email, password: password,);
      User? user = result.user;
      await database().createUserData(name, email, password, user!.uid);
      return user;
    } catch (e) {
      print(e.toString());
    }
  }


  Future loginUser(String name, String email, String password) async {
    try {
      UserCredential result = await _auth.signInWithEmailAndPassword(
          email: email, password: password);

      return result.user;
    } catch (e) {
      print(e.toString());
    }
  }

  Future sendPasswordResetEmail(String email) async {
    try {
      await _auth.sendPasswordResetEmail(email: email);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<UserCredential> signInWithFacebook() async {
    final AccessToken result = (await FacebookAuth.instance.login()) as AccessToken;

    final OAuthCredential facebookAuthCredential =
    FacebookAuthProvider.credential(result.token);

    return await FirebaseAuth.instance
        .signInWithCredential(facebookAuthCredential);
  }


  Future<void> signInWithGoogle() async {
    final googleSignIn = GoogleSignIn();
    final googleUser = await googleSignIn.signIn();
    if (googleUser != null) {
      final googleAuth = await googleUser.authentication;
      if (googleAuth.idToken != null) {
        final userCredential = await _auth.signInWithCredential(
          GoogleAuthProvider.credential(
              idToken: googleAuth.idToken, accessToken: googleAuth.accessToken),
        );
        if (userCredential.user != null) {
          return;
        } else {
          return;
        }
      } else {
        throw FirebaseAuthException(
          message: "Sign in aborded by user",
          code: "ERROR_ABORDER_BY_USER",
        );
      }
    }
  }
}