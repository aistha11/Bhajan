import 'dart:convert';
import 'dart:developer';

import 'package:bhajan_admin/models/models.dart';
import 'package:bhajan_admin/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class AddBhajanController extends GetxController {
  final QuillController lyricsController = QuillController.basic();
  final QuillController chordLyricsController = QuillController.basic();
  final TextEditingController title = TextEditingController();
  final TextEditingController subTitle = TextEditingController();
  final TextEditingController scale = TextEditingController();
  final TextEditingController taal = TextEditingController();

  var bhajanFormKey = GlobalKey<FormState>().obs;

  Future<void> save(String cat, int length) async {
    var lyricsChordsJson = chordLyricsController.document.toDelta().toJson();
    var lyricsOnlyJson = lyricsController.document.toDelta().toJson();
    String lyricsOnly = jsonEncode(lyricsOnlyJson);
    String lyricsChords = jsonEncode(lyricsChordsJson);
    if (lyricsOnly.isEmpty || lyricsChords.isEmpty) {
      Get.snackbar("Error!!!", "Something is missing. Correct the Editor");
      return;
    }

    if (bhajanFormKey.value.currentState!.validate()) {
      Bhajan bhajan = Bhajan(
        id: length.toString(),
        uid: length,
        title: title.text,
        subTitle: subTitle.text,
        scale: scale.text,
        taal: taal.text,
        lyrics: lyricsOnly,
        lyricsChords: lyricsChords,
        updateDate: DateTime.now(),
      );

      try {
        if (cat == '1') {
           BhajanService.createBhajan(bhajan).then((value) {
            Get.snackbar("Success", "Your bhajan is added successfully");
          });
        }
        if (cat == '2') {
           ChorusService.createBhajan(bhajan).then((value) {
            Get.snackbar("Success", "Your chorus is added successfully");
          });
        }
        if (cat == '3') {
           BalChorusService.createBhajan(bhajan).then((value) {
            Get.snackbar("Success", "Your bal chorus is added successfully");
          });
        }
        if (cat == '4') {
           NewSongsService.createBhajan(bhajan).then((value) {
            Get.snackbar("Success", "Your new song is added successfully");
          });
        }

        // Get.back();
      } catch (e) {
        log(e.toString());
        Get.snackbar("Error!!!Something went wrong", e.toString());
      }
      clear();
    }else{
      return;
    }
    Get.back();
  }

  void clear() {
    title.text = "";
    subTitle.text = "";
    scale.text = "";
    taal.text = "";
    chordLyricsController.dispose();
    lyricsController.dispose();
  }
}
