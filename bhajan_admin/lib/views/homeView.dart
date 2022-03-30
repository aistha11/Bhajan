import 'package:bhajan_admin/routes/appPages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  const HomeView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Bhajan Dashboard"),
        ),
        body: const Center(
          child: Text("Bhajan App"),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Get.toNamed(Routes.ADDBHAJAN);
          },
          child: const Icon(Icons.add),
        ),
      );
  }
}