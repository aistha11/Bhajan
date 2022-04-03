import 'package:bhajan_admin/controllers/controllers.dart';
import 'package:bhajan_admin/models/bhajan.dart';
import 'package:bhajan_admin/views/lyricsView.dart';
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
                leading: Text(i.toString()),
                title: Text(bhajan.title),
                onTap: (){
                  Get.to(()=>LyricsView(catId: '1',bhajan: bhajan,));
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.toNamed("/addBhajan/1");
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
