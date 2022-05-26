import 'package:badges/badges.dart';
import 'package:bhajan_web/controllers/controllers.dart';
import 'package:bhajan_web/models/bhajan.dart';
import 'package:bhajan_web/views/editBhajan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BhajanView extends StatelessWidget {
  BhajanView({Key? key}) : super(key: key);
  final BhajanController bhajanController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<BhajanController>(
        builder: (controller) {
          if (controller.bhajanList.isEmpty) {
            return const Center(
              child: Text("Bhajan List is empty"),
            );
          }
          return ListView.builder(
            itemCount: controller.bhajanList.length,
            itemBuilder: (_, i) {
              Bhajan bhajan = controller.bhajanList[i];
              return ListTile(
                leading: Text(bhajan.id.toString()),
                title: Text(
                  bhajan.title,
                  overflow: TextOverflow.ellipsis,
                ),
                subtitle: Text(
                  "${bhajan.subTitle}\nScale: ${bhajan.scale}, Taal: ${bhajan.taal}",
                  overflow: TextOverflow.ellipsis,
                ),
                isThreeLine: true,
                onTap: () {
                  Get.to(() => EditBhajan(
                        cat: '1',
                        bhajan: bhajan,
                      ));
                },
                trailing: IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                        title: "Warning",
                        content: const Text(
                          "Do you really want to delete this Bhajan?",
                        ),
                        textConfirm: "Yes",
                        onConfirm: () {
                          Get.find<BhajanController>().delete("1", bhajan.id!);
                          Get.back();
                        },
                        textCancel: "No",
                        onCancel: () {
                          Get.back();
                        });
                  },
                  icon: const Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: GetX<BhajanController>(
        builder: (bhjnCtrl) {
          return Badge(
            badgeColor: Colors.blue,
            badgeContent: Text("${bhjnCtrl.bhajanList.length + 1}"),
            child: FloatingActionButton(
              onPressed: () {
                Get.toNamed("/addBhajan/1/${bhjnCtrl.bhajanList.length + 1}");
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}
