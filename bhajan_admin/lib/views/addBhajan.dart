import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddBhajan extends StatelessWidget {
  const AddBhajan({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Bhajan"),
        leading: IconButton(
          icon: Icon(Icons.adaptive.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
      ),
      body: Center(
        child: Text("Bhajan TextFields"),
      ),
    );
  }
}
