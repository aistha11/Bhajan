import 'package:bhajan_web/controllers/firebaseAuthController.dart';
import 'package:bhajan_web/views/auth/authView.dart';
import 'package:bhajan_web/views/homeView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Wrapper extends GetView<FirebaseAuthController> {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      if (controller.status == Status.AUTHENTICATED) {
        return const HomeView();
      } else {
        return AuthView();

      }
    });
  }
}