
import 'package:bhajan/controllers/bhajanController.dart';
import 'package:bhajan/models/models.dart';
import 'package:bhajan/views/lyricsView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BhajanView extends StatelessWidget {
  const BhajanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetX<BhajanController>(
        builder: (controller) {
          if (controller.bhajanList.isEmpty) {
            return Center(
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
                  Get.to(() => LyricsView(
                        catId: '1',
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
