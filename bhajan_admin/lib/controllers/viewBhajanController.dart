import 'dart:convert';
import 'dart:developer';

import 'package:bhajan_admin/controllers/controllers.dart';
import 'package:bhajan_admin/models/bhajan.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class ViewBhajanController extends GetxController {
  String bhajanId = "";
  Rx<Bhajan?> bhajan = Rx<Bhajan>(Bhajan(
    title: "",
    scale: "",
    taal: "",
    lyricsChords: "",
    lyrics: "",
    updateDate: DateTime.now(),
  ));
  QuillController quillController = QuillController.basic();

  var showChord = false.obs;

  @override
  void onInit() {
    bhajanId = Get.parameters['id']!;
    bhajan.value = Get.find<BhajanController>().getBhajanById(bhajanId);
    log("Bhajan Id: $bhajanId");
    super.onInit();
  }

  void toggle(bool val) {
    if (val) {
      _loadQuill(bhajan.value!.lyricsChords);
    } else {
      _loadQuill(bhajan.value!.lyricsChords);
    }
  }

  Future<void> _loadQuill(String strResult) async {
    final doc = Document.fromJson(jsonDecode(strResult));
    quillController = QuillController(
        document: doc, selection: const TextSelection.collapsed(offset: 0));
  }
}
