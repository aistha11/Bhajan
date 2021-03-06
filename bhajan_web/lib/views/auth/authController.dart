import 'package:bhajan_web/controllers/firebaseAuthController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthController extends GetxController {
  // For sign in
  var signInFormKey = GlobalKey<FormState>().obs;
  var email1 = TextEditingController(text: "bsalsunar2@gmail.com").obs;
  var password1 = TextEditingController().obs; // @BhajanA!

  Future<void> signIn() async {
    if (signInFormKey.value.currentState!.validate()) {
      await Get.find<FirebaseAuthController>()
          .signIn(email1.value.text, password1.value.text);
      clear();
    }
  }

  // Clear the fields
  clear() {
    password1.value.text = "";
  }
}