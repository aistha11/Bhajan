import 'package:bhajan/controllers/bhajanController.dart';
import 'package:bhajan/models/models.dart';
import 'package:bhajan/views/lyricsView.dart';
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
                        // catId: '2',
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