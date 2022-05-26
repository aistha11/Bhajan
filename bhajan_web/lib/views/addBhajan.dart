import 'package:bhajan_web/controllers/controllers.dart';
import 'package:bhajan_web/widgets/quillEditorColumn.dart';
import 'package:bhajan_web/widgets/widgets.dart';
import 'package:flutter/material.dart';
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
              TextSpan(text: getAppTitle(cat), style: const TextStyle(fontSize: 22)),
        ),
        leading: IconButton(
          icon: Icon(Icons.adaptive.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: () {
              int? len = int.tryParse(length);
              if (len == null) {
                Get.snackbar("Sorry",
                    "Can't add at the moment fix the id of new bhajan.");
                return;
              }
              controller.save(cat, len);
            },
          ),
          const SizedBox(
            width: 15,
          )
        ],
      ),
      body: Form(
        key: controller.bhajanFormKey.value,
        child: Row(
          children: [
            SizedBox(
              width: Get.width * 0.40,
              child: Column(
                children: [
                  const SizedBox(
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
                      // maxLength: 60,
                      decoration: InputDecoration(
                        hintText: "Enter Title",
                        border: const OutlineInputBorder(),
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
                      // maxLength: 60,
                      decoration: InputDecoration(
                        hintText: "Enter Title in English",
                        border: const OutlineInputBorder(),
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
                            // maxLength: 5,
                            decoration: InputDecoration(
                              hintText: "Enter Scale",
                              border: const OutlineInputBorder(),
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
                            // maxLength: 5,
                            decoration: InputDecoration(
                              hintText: "Enter Taal",
                              border: const OutlineInputBorder(),
                              filled: true,
                              fillColor: Colors.grey[350],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  CustomTFF(
                    title: "Video Url",
                    field: TextFormField(
                      controller: controller.videoUrl,
                      decoration: InputDecoration(
                        hintText: "Enter Video Url",
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey[350],
                      ),
                    ),
                  ),
                  CustomTFF(
                    title: "Tutorial Url",
                    field: TextFormField(
                      controller: controller.tutorialUrl,
                      decoration: InputDecoration(
                        hintText: "Enter Tutorial Url",
                        border: const OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey[350],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Expanded(
                    child: DefaultTabController(
                      length: 2,
                      child: Column(
                        children: [
                          Container(
                            margin: const EdgeInsets.all(15),
                            child: const TabBar(
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
                            child: TabBarView(
                              children: [
                                DefaultTabController(
                                  length: 2,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(15),
                                        child: const TabBar(
                                          tabs: [
                                            Tab(
                                              text: "With English",
                                            ),
                                            Tab(
                                              text: "Without English",
                                            ),
                                          ],
                                          labelColor: Colors.red,
                                          padding: EdgeInsets.all(5),
                                        ),
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          children: [
                                            QuillEditorColumn(
                                              controller: controller
                                                  .chordLyricsEngController,
                                            ),
                                            QuillEditorColumn(
                                              controller: controller
                                                  .chordLyricsController,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                DefaultTabController(
                                  length: 2,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: const EdgeInsets.all(15),
                                        child: const TabBar(
                                          tabs: [
                                            Tab(
                                              text: "With English",
                                            ),
                                            Tab(
                                              text: "Without English",
                                            ),
                                          ],
                                          labelColor: Colors.red,
                                          padding: EdgeInsets.all(5),
                                        ),
                                      ),
                                      Expanded(
                                        child: TabBarView(
                                          children: [
                                            QuillEditorColumn(
                                              controller: controller
                                                  .lyricsEngController,
                                            ),
                                            QuillEditorColumn(
                                              controller: controller
                                                  .lyricsController,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}


