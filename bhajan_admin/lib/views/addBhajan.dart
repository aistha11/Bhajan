import 'package:bhajan_admin/controllers/controllers.dart';
import 'package:bhajan_admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class AddBhajan extends GetView<AddBhajanController> {
  AddBhajan({Key? key}) : super(key: key);

  final String cat = Get.parameters["catId"]!;
  final String length = Get.parameters["length"]!;

  String getAppTitle(String n) {
    switch (n) {
      case '1':
        return "Add Bhajan";
      case '2':
        return "Add Chorus";
      case '3':
        return "Add Bal Chorus";
      case '4':
        return "Add New Songs";
      default:
        return "Add Bhajan";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text:
              TextSpan(text: getAppTitle(cat), style: TextStyle(fontSize: 22)),
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
              int? len = int.tryParse(length);
              if( len == null){
                Get.snackbar("Sorry", "Can't add at the moment fix the id of new bhajan.");
                return;
              }
              controller.save(cat,len);
            },
          ),
          SizedBox(
            width: 15,
          )
        ],
      ),
      body: Form(
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
            CustomTFF(
              title: "Subtitle",
              field: TextFormField(
                controller: controller.subTitle,
                validator: (val) {
                  if (val == "") {
                    return "Enter Title in English:*";
                  }
                  return null;
                },
                onFieldSubmitted: (val) {
                  // controller.name.value.text = val;
                },
                maxLength: 60,
                decoration: InputDecoration(
                  hintText: "Enter Title in English",
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.grey[350],
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CustomTFF(
                  title: "Scale",
                  field: SizedBox(
                    width: 120,
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
                    width: 120,
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
            Expanded(
              child: DefaultTabController(
                length: 2,
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.all(15),
                      child: TabBar(
                        tabs: [
                          Tab(
                            text: "With Chord",
                          ),
                          Tab(
                            text: "Without Chord",
                          ),
                        ],
                        labelColor: Colors.red,
                        padding: EdgeInsets.all(5),
                      ),
                    ),
                    Expanded(
                      child: TabBarView(children: [
                        Column(
                          children: [
                            QuillToolbar.basic(
                              controller: controller.chordLyricsController,
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
                              showAlignmentButtons: true,
                              showCenterAlignment: true,
                              showBackgroundColorButton: false,
                              showSmallButton: false,
                            ),
                            Expanded(
                              child: Container(
                                // height: 400,
                                decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    borderRadius: BorderRadius.circular(30)),
                                margin: EdgeInsets.all(18),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: QuillEditor.basic(
                                    controller:
                                        controller.chordLyricsController,
                                    readOnly: false, // true for view only mode
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            QuillToolbar.basic(
                              controller: controller.lyricsController,
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
                              showAlignmentButtons: true,
                              showCenterAlignment: true,
                              showBackgroundColorButton: false,
                            ),
                            Expanded(
                              child: Container(
                                // height: 400,
                                decoration: BoxDecoration(
                                    color: Colors.grey[350],
                                    borderRadius: BorderRadius.circular(30)),
                                margin: EdgeInsets.all(18),
                                child: Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: QuillEditor.basic(
                                    controller: controller.lyricsController,
                                    readOnly: false, // true for view only mode
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ]),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
