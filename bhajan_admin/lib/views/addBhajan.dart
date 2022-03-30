

import 'dart:developer';

import 'package:bhajan_admin/controllers/controllers.dart';
import 'package:bhajan_admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class AddBhajan extends GetView<AddBhajanController> {
  AddBhajan({Key? key}) : super(key: key);
  
  final int cat = Get.arguments["cat"];

  String getAppTitle(int n){
    switch (n) {
      case 1:
        return "Add Bhajan";
      case 2:
        return "Add Chorus";
      case 3:
        return "Add Bal Chorus";
      default:
        return "Add Bhajan";
    }
  }

  @override
  Widget build(BuildContext context) {
    log(cat.toString());
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(text: getAppTitle(cat), style: TextStyle(fontSize: 22)),
        ),
        leading: IconButton(
          icon: Icon(Icons.adaptive.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              controller.save(cat);
            },
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: ScrollController(),
        child: Form(
          key: controller.bhajanFormKey.value,
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              CustomTFF(
                title: "Title",
                field: TextFormField(
                  controller: controller.title,
                  validator: (val) {
                    if (val == "") {
                      return "Enter Title:*";
                    }
                    return null;
                  },
                  onFieldSubmitted: (val) {
                    // controller.name.value.text = val;
                  },
                  maxLength: 60,
                  decoration: InputDecoration(
                    hintText: "Enter Title",
                    border: OutlineInputBorder(),
                    filled: true,
                    fillColor: Colors.grey[350],
                  ),
                ),
              ),
              Row(
                children: [
                  CustomTFF(
                    title: "Scale",
                    field: SizedBox(
                      width: Get.width / 3,
                      child: TextFormField(
                        controller: controller.scale,
                        validator: (val) {
                          if (val == "") {
                            return "Enter Scale:*";
                          }
                          return null;
                        },
                        onFieldSubmitted: (val) {
                          // controller.name.value.text = val;
                        },
                        maxLength: 5,
                        decoration: InputDecoration(
                          hintText: "Enter Scale",
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.grey[350],
                        ),
                      ),
                    ),
                  ),
                  CustomTFF(
                    title: "Taal",
                    field: SizedBox(
                      width: Get.width / 3,
                      child: TextFormField(
                        controller: controller.taal,
                        validator: (val) {
                          if (val == "") {
                            return "Enter Taal:*";
                          }
                          return null;
                        },
                        onFieldSubmitted: (val) {
                          // controller.name.value.text = val;
                        },
                        maxLength: 5,
                        decoration: InputDecoration(
                          hintText: "Enter Taal",
                          border: OutlineInputBorder(),
                          filled: true,
                          fillColor: Colors.grey[350],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              QuillToolbar.basic(
                controller: controller.quillController,
                showStrikeThrough: false,
                showCameraButton: false,
                showCodeBlock: false,
                showDirection: false,
                showImageButton: false,
                showLink: false,
                showInlineCode: false,
                showIndent: false,
                showListBullets: false,
                showListCheck: false,
                showListNumbers: false,
                showQuote: false,
                showVideoButton: false,
                showClearFormat: false,
                showCenterAlignment: true,
              ),
              Container(
                height: 400,
                decoration: BoxDecoration(
                  color: Colors.grey[350],
                  borderRadius: BorderRadius.circular(30)
                ),
                margin: EdgeInsets.all(18),
                child: Padding(
                  padding: const EdgeInsets.all(18.0),
                  child: Flexible(
                    child: QuillEditor.basic(
                      controller: controller.quillController,
                      readOnly: false, // true for view only mode
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
