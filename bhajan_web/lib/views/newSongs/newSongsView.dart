import 'package:badges/badges.dart';
import 'package:bhajan_web/controllers/controllers.dart';
import 'package:bhajan_web/models/models.dart';
import 'package:bhajan_web/views/editBhajan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NewSongsView extends StatelessWidget {
  const NewSongsView({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<BhajanController>(
        builder: (controller) {
          if (controller.newSongsList.isEmpty) {
            return const Center(
              child: Text("New Songs List is empty"),
            );
          }
          return ListView.builder(
            itemCount: controller.newSongsList.length,
            itemBuilder: (_, i) {
              Bhajan bhajan = controller.newSongsList[i];
              return ListTile(
                leading: Text(bhajan.id.toString()),
                title: Text(bhajan.title,overflow: TextOverflow.ellipsis,),
                subtitle: Text("${bhajan.subTitle}\nScale: ${bhajan.scale}, Taal: ${bhajan.taal}",overflow: TextOverflow.ellipsis,),
                isThreeLine: true,
                onTap: () {
                  Get.to(() => EditBhajan(
                        cat: '4',
                        bhajan: bhajan,
                      ));
                },
                trailing: IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Warning",
                      content: const Text(
                        "Do you really want to delete this New Song?",
                      ),
                      textConfirm: "Yes",
                      onConfirm: (){
                        Get.find<BhajanController>().delete("4", bhajan.id!);
                        Get.back();
                      },
                      textCancel: "No",
                      onCancel: (){
                        Get.back();
                      }
                    );
                    
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
            badgeContent: Text("${bhjnCtrl.newSongsList.length + 1}"),
            child: FloatingActionButton(
              onPressed: () {
                Get.toNamed("/addBhajan/4/${bhjnCtrl.newSongsList.length + 1}");
              },
              child: const Icon(Icons.add),
            ),
          );
        },
      ),
    );
  }
}