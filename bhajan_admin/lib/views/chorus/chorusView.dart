import 'package:bhajan_admin/controllers/controllers.dart';
import 'package:bhajan_admin/models/models.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ChorusView extends StatelessWidget {
  const ChorusView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<BhajanController>(
        builder: (controller) {
          if (controller.chorusList.isEmpty) {
            return Center(
              child: Text("Chorus List is empty"),
            );
          }
          return ListView.builder(
            itemCount: controller.chorusList.length,
            itemBuilder: (_, i) {
              Bhajan bhajan = controller.chorusList[i];
              return ListTile(
                leading: Text(i.toString()),
                title: Text(bhajan.title),
                onTap: (){
                  
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.toNamed("/addBhajan/2");
                },
                child: const Icon(Icons.add),
              ),
    );
  }
}