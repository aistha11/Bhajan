
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum Status { UNINITIALIZED, AUTHENTICATED, AUTHENTICATING, UNAUTHENTICATED }


class FirebaseAuthController extends GetxController {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Rx<User?>? _firebaseUser;

  final Rx<Status> _status = Rx<Status>(Status.UNINITIALIZED);

  Status get status => _status.value;

  // User? get fUser => _firebaseUser!.value;

  User? get user => _auth.currentUser;

  @override
  void onInit() {
    _firebaseUser?.bindStream(_auth.authStateChanges());

    log(" Auth Change :   ${_auth.currentUser}");

    if (_auth.currentUser == null) {
      log("User is not logged in");
      _status.value = Status.UNAUTHENTICATED;

      update();
    } else {
      log("User is logged in");

      _status.value = Status.AUTHENTICATED;
      update();
    }
    super.onInit();
  }

  Future<void> signIn(String email, String password) async {
    try {
      _status.value = Status.AUTHENTICATING;
      update();
      log("Sign In with:{email:$email,password:$password}");
      await _auth
          .signInWithEmailAndPassword(email: email, password: password)
          .then(
        (UserCredential uCreds) {
          log(uCreds.toString());
          _status.value = Status.AUTHENTICATED;
          update();
        },
      );
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "invalid-email":
          showSnackBar("Sorry!!", "The provided email is invalid");
          break;
        case "user-disabled":
          showSnackBar("Sorry!!", "The provided email is disabled");
          break;
        case "user-not-found":
          showSnackBar("Sorry!!", "The user is not found");
          break;
        case "wrong-password":
          showSnackBar(
              "Sorry!! Try again", "The provided password is invalid");
          break;
        default:
          showSnackBar("Sorry!!", "Something went wrong");
          break;
      }

      _status.value = Status.UNAUTHENTICATED;
      update();
    }
  }

  // For logout from the app
  Future<void> signOut() async {
    try {
      _auth.signOut();
      _status.value = Status.UNAUTHENTICATED;
      update();
    } catch (e) {
      showSnackBar("Error!!!", e.toString());
      _status.value = Status.AUTHENTICATED;
      update();
    }
  }

   showSnackBar(String title, String message) {
    Get.snackbar(title, message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.red);
  }
}