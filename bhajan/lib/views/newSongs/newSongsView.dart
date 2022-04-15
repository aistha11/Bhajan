import 'package:bhajan/controllers/bhajanController.dart';
import 'package:bhajan/models/models.dart';
import 'package:bhajan/views/lyricsView.dart';
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
                  Get.to(() => LyricsView(
                        catId: '4',
                        bhajan: bhajan,
                      ));
                },
                
              );
            },
          );
        },
      ),
    );
  }
}