import 'package:bhajan_admin/controllers/controllers.dart';
import 'package:bhajan_admin/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BalChorusView extends StatelessWidget {
  const BalChorusView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<BhajanController>(
        builder: (controller) {
          if (controller.balChorusList.isEmpty) {
            return Center(
              child: Text("Bal Chorus List is empty"),
            );
          }
          return ListView.builder(
            itemCount: controller.balChorusList.length,
            itemBuilder: (_, i) {
              Bhajan bhajan = controller.balChorusList[i];
              return ListTile(
                leading: Text(i.toString()),
                title: Text(bhajan.title),
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.toNamed("/addBhajan/3");
                },
                child: const Icon(Icons.add),
              ),
    );
  }
}