import 'package:bhajan_web/views/auth/authController.dart';
import 'package:bhajan_web/views/auth/signIn.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

const TextStyle boldText = TextStyle(
  fontWeight: FontWeight.bold,
);

class AuthView extends StatelessWidget {
 

  final AuthController authController =
      Get.put<AuthController>(AuthController());

  AuthView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: <Widget>[
          FractionallySizedBox(
            heightFactor: 0.5,
            child: Container(
              color: Colors.red,
            ),
          ),
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: <Widget>[
                const SizedBox(height: kToolbarHeight - 16.0),
                Container(
                  alignment: Alignment.center,
                  height: (MediaQuery.of(context).size.height / 2) - 150,
                ),
                const SizedBox(height: 20.0),
                Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: const [
                        BoxShadow(
                          color: Colors.red,
                          offset: Offset(5, 5),
                          blurRadius: 10.0,
                        )
                      ]),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: const <Widget>[SignIn()],
                  ),
                ),
                const SizedBox(height: 50.0),
              ],
            ),
          ),
        ],
      ),
    );
  }
}