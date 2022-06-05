import 'package:bhajan/controllers/bhajanController.dart';
import 'package:bhajan/models/models.dart';
import 'package:bhajan/views/lyricsView.dart';
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
                        // catId: '3',
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