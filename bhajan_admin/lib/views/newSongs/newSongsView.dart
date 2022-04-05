import 'package:badges/badges.dart';
import 'package:bhajan_admin/controllers/controllers.dart';
import 'package:bhajan_admin/models/models.dart';
import 'package:bhajan_admin/views/lyricsView.dart';
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
            return Center(
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
                  Get.to(() => LyricsView(
                        catId: '4',
                        bhajan: bhajan,
                      ));
                },
                trailing: IconButton(
                  onPressed: () {
                    Get.defaultDialog(
                      title: "Warning",
                      content: Text(
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
                  icon: Icon(Icons.delete),
                ),
              );
            },
          );
        },
      ),
      floatingActionButton: GetX<BhajanController>(
        builder: (bhjnCtrl) {
          return Badge(
            child: FloatingActionButton(
              onPressed: () {
                Get.toNamed("/addBhajan/4/${bhjnCtrl.newSongsList.length + 1}");
              },
              child: const Icon(Icons.add),
            ),
            badgeColor: Colors.blue,
            badgeContent: Text("${bhjnCtrl.newSongsList.length + 1}"),
          );
        },
      ),
    );
  }
}