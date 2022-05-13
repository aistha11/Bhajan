// import 'dart:developer';

import 'dart:convert';
import 'dart:developer';

import 'package:bhajan_admin/models/models.dart';
import 'package:bhajan_admin/services/services.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class BhajanController extends GetxController {
  final Rx<List<Bhajan>> _bhajanList = Rx<List<Bhajan>>([]);
  List<Bhajan> get bhajanList => _bhajanList.value;
  final Rx<List<Bhajan>> _chorusList = Rx<List<Bhajan>>([]);
  List<Bhajan> get chorusList => _chorusList.value;
  final Rx<List<Bhajan>> _balChorusList = Rx<List<Bhajan>>([]);
  List<Bhajan> get balChorusList => _balChorusList.value;
  final Rx<List<Bhajan>> _newSongsList = Rx<List<Bhajan>>([]);
  List<Bhajan> get newSongsList => _newSongsList.value;

  // Bhajan? getBhajanById(String id){
  //   log("Finding Bhajan with id $id");
  //   var resultList =  bhajanList.where((e) => e.id == id).toList();
  //   if(resultList.isEmpty){
  //     return null;
  //   }else{
  //     return resultList[0];
  //   }
  // }

  Future<void> updateBhajan({
    // required QuillController lyricsController,
    // required QuillController chordLyricsController,
    // required QuillController lyricsEngController,
    // required QuillController chordLyricsEngController,
    required Bhajan upBhajan,
    required String catId,
  }) async {
    // var lyricsChordsJson = chordLyricsController.document.toDelta().toJson();
    // var lyricsOnlyJson = lyricsController.document.toDelta().toJson();
    // var lyricsChordsEngJson = chordLyricsEngController.document.toDelta().toJson();
    // var lyricsOnlyEngJson = lyricsEngController.document.toDelta().toJson();
    // String lyricsOnly = jsonEncode(lyricsOnlyJson);
    // String lyricsChords = jsonEncode(lyricsChordsJson);
    // String lyricsEngOnly = jsonEncode(lyricsOnlyEngJson);
    // String lyricsChordsEng = jsonEncode(lyricsChordsEngJson);
    // if (lyricsOnly.isEmpty || lyricsChords.isEmpty) {
    //   Get.snackbar("Error!!!", "Something is missing. Correct the Editor");
    //   return;
    // }
    // Bhajan upBhajan = Bhajan(
    //   id: bhajan.id,
    //   uid: int.parse(bhajan.id!),
    //   title: bhajan.title,
    //   subTitle: bhajan.subTitle,
    //   scale: bhajan.scale,
    //   taal: bhajan.taal,
    //   lyrics: lyricsOnly,
    //   lyricsEng: lyricsEngOnly,
    //   videoUrl: bhajan.videoUrl,
    //   tutorialUrl: bhajan.tutorialUrl,
    //   lyricsChords: lyricsChords,
    //   lyricsChordsEng: lyricsChordsEng,
    //   updateDate: DateTime.now(),
    // );
    try {
      if (catId == "1") {
        BhajanService.updateBhajan(upBhajan).then((value) {
          Get.snackbar("Hurray!!", "Bhajan Edited Successfully");
        });
      }
      if (catId == "2") {
        ChorusService.updateBhajan(upBhajan).then((value) {
          Get.snackbar("Hurray!!", "Chorus Edited Successfully");
        });
      }
      if (catId == "3") {
        BalChorusService.updateBhajan(upBhajan).then((value) {
          Get.snackbar("Hurray!!", "Bal-Chorus Edited Successfully");
        });
      }
      if (catId == "4") {
        NewSongsService.updateBhajan(upBhajan).then((value) {
          Get.snackbar("Hurray!!", "New Song Edited Successfully");
        });
      }
    } catch (e) {
      log(e.toString());
      Get.snackbar("Error!!", "Cannot update at the moment.");
    }
    Get.back();
  }

  Future<void> delete(String catId, String bhajanId) async {
    if (catId == "1") {
      BhajanService.deleteBhajan(bhajanId).then((value) {
        Get.snackbar("Success", "Bhajan Deleted Successfully");
      });
    }
    if (catId == "2") {
      ChorusService.deleteBhajan(bhajanId).then((value) {
        Get.snackbar("Success", "Chorus Deleted Successfully");
      });
    }
    if (catId == "3") {
      BalChorusService.deleteBhajan(bhajanId).then((value) {
        Get.snackbar("Success", "Bal-Chorus Deleted Successfully");
      });
    }
    if (catId == "4") {
      NewSongsService.deleteBhajan(bhajanId).then((value) {
        Get.snackbar("Success", "New Song Deleted Successfully");
      });
    }
  }

  @override
  void onInit() {
    _bhajanList.bindStream(BhajanService.getBhajans());
    _chorusList.bindStream(ChorusService.getBhajans());
    _balChorusList.bindStream(BalChorusService.getBhajans());
    _newSongsList.bindStream(NewSongsService.getBhajans());
    super.onInit();
  }
}
