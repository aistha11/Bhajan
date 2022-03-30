import 'dart:convert';
import 'dart:developer';

import 'package:bhajan_admin/models/models.dart';
import 'package:bhajan_admin/services/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class AddBhajanController extends GetxController {
  final QuillController quillController = QuillController.basic();
  final TextEditingController title = TextEditingController();
  final TextEditingController scale = TextEditingController();
  final TextEditingController taal = TextEditingController();

  var bhajanFormKey = GlobalKey<FormState>().obs;

  Future<void> save(int cat) async {
    var jsonData = quillController.document.toDelta().toJson();

    if (bhajanFormKey.value.currentState!.validate()) {
      Bhajan bhajan = Bhajan(
        title: title.text,
        scale: scale.text,
        taal: taal.text,
        content: jsonEncode(jsonData),
        updateDate: DateTime.now(),
      );
      try {
        if(cat == 1){
          await BhajanService.createBhajan(bhajan);
          Get.snackbar("Success","Your bhajan is added successfully");
          Get.back();
        }
        if(cat == 2){
          await ChorusService.createBhajan(bhajan);
          Get.snackbar("Success","Your chorus is added successfully");
          Get.back();
        }
        if(cat == 3){
          await BalChorusService.createBhajan(bhajan);
          Get.snackbar("Success","Your bal chorus is added successfully");
          Get.back();
        }
        
        
        // Get.back();
      } catch (e) {
        log(e.toString());
        Get.snackbar("Error!!!Something went wrong",e.toString());
      }
    }
  }

  void clear(){
    title.text = "";
    scale.text = "";
    taal.text = "";
  }
}