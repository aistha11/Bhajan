import 'dart:convert';

import 'package:bhajan_admin/controllers/bhajanController.dart';
import 'package:bhajan_admin/models/bhajan.dart';
import 'package:bhajan_admin/widgets/quillEditorColumn.dart';
import 'package:bhajan_admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class EditBhajan extends StatefulWidget {
  const EditBhajan({
    Key? key,
    required this.bhajan,
    required this.cat,
  }) : super(key: key);

  final Bhajan bhajan;
  final String cat;

  @override
  State<EditBhajan> createState() => _EditBhajanState();
}

class _EditBhajanState extends State<EditBhajan> {
  QuillController _chordLyricsController = QuillController.basic();
  QuillController _lyricsController = QuillController.basic();
  QuillController _chordLyricsEngController = QuillController.basic();
  QuillController _lyricsEngController = QuillController.basic();

  final TextEditingController title = TextEditingController();
  final TextEditingController subTitle = TextEditingController();
  final TextEditingController scale = TextEditingController();
  final TextEditingController taal = TextEditingController();
  final TextEditingController videoUrl = TextEditingController();
  final TextEditingController tutorialUrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    title.text = widget.bhajan.title;
    subTitle.text = widget.bhajan.subTitle;
    scale.text = widget.bhajan.scale;
    taal.text = widget.bhajan.taal;
    videoUrl.text = widget.bhajan.videoUrl ?? "";
    tutorialUrl.text = widget.bhajan.tutorialUrl ?? "";
    _loadChordLyrics(widget.bhajan.lyricsChords);
    _loadLyrics(widget.bhajan.lyrics);
    if (widget.bhajan.lyricsChordsEng != null) {
      _loadChordEngLyrics(widget.bhajan.lyricsChordsEng!);
    }
    if (widget.bhajan.lyricsEng != null) {
      _loadEngLyrics(widget.bhajan.lyricsEng!);
    }
  }

  Future<void> _loadChordLyrics(String strResult) async {
    final doc = Document.fromJson(jsonDecode(strResult));
    setState(() {
      _chordLyricsController = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  Future<void> _loadChordEngLyrics(String strResult) async {
    final doc = Document.fromJson(jsonDecode(strResult));
    setState(() {
      _chordLyricsEngController = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  Future<void> _loadLyrics(String strResult) async {
    final doc = Document.fromJson(jsonDecode(strResult));
    setState(() {
      _lyricsController = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  Future<void> _loadEngLyrics(String strResult) async {
    final doc = Document.fromJson(jsonDecode(strResult));
    setState(() {
      _lyricsEngController = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  String getAppTitle(String n) {
    switch (n) {
      case '1':
        return "Edit Bhajan";
      case '2':
        return "Edit Chorus";
      case '3':
        return "Edit Bal Chorus";
      case '4':
        return "Edit New Songs";
      default:
        return "Edit Bhajan";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: RichText(
          text: TextSpan(
              text: getAppTitle(widget.cat), style: TextStyle(fontSize: 22)),
        ),
        leading: IconButton(
          icon: Icon(Icons.adaptive.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: [
          IconButton(
            onPressed: () {
              Get.defaultDialog(
                  title: "Warning",
                  content: MyText(
                    text: "Do you really want to delete this Bhajan?",
                  ),
                  textConfirm: "Yes",
                  onConfirm: () {
                    Get.find<BhajanController>()
                        .delete(widget.cat, widget.bhajan.id!);
                    Get.back();
                    Get.back();
                  },
                  textCancel: "No",
                  onCancel: () {
                    Get.back();
                  });
            },
            icon: Icon(Icons.delete),
          ),
          SizedBox(
            width: 25,
          ),
          IconButton(
            icon: Icon(Icons.done),
            onPressed: () {
              var lyricsChordsJson =
                  _chordLyricsController.document.toDelta().toJson();
              var lyricsOnlyJson =
                  _lyricsController.document.toDelta().toJson();
              var lyricsChordsEngJson =
                  _chordLyricsEngController.document.toDelta().toJson();
              var lyricsOnlyEngJson =
                  _lyricsEngController.document.toDelta().toJson();
              String lyricsOnly = jsonEncode(lyricsOnlyJson);
              String lyricsChords = jsonEncode(lyricsChordsJson);
              String lyricsEngOnly = jsonEncode(lyricsOnlyEngJson);
              String lyricsChordsEng = jsonEncode(lyricsChordsEngJson);
              if (lyricsOnly.isEmpty || lyricsChords.isEmpty) {
                Get.snackbar(
                    "Error!!!", "Something is missing. Correct the Editor");
                return;
              }

              Bhajan upBhajan = Bhajan(
                id: widget.bhajan.id,
                uid: int.parse(widget.bhajan.id!),
                title: title.text,
                subTitle: subTitle.text,
                scale: scale.text,
                taal: taal.text,
                lyrics: lyricsOnly,
                lyricsEng: lyricsEngOnly,
                videoUrl: videoUrl.text,
                tutorialUrl: tutorialUrl.text,
                lyricsChords: lyricsChords,
                lyricsChordsEng: lyricsChordsEng,
                updateDate: DateTime.now(),
              );

              Get.find<BhajanController>().updateBhajan(
                // chordLyricsController: _chordLyricsController,
                // lyricsController: _lyricsController,
                // chordLyricsEngController: _chordLyricsEngController,
                // lyricsEngController: _lyricsEngController,
                upBhajan: upBhajan,
                catId: widget.cat,
              );
            },
          ),
          SizedBox(
            width: 25,
          )
        ],
      ),
      body: Form(
        child: Row(
          children: [
            SizedBox(
              width: Get.width * 0.40,
              child: Column(
                children: [
                  SizedBox(
                    height: 15,
                  ),
                  CustomTFF(
                    title: "Title",
                    field: TextFormField(
                      controller: title,
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
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey[350],
                      ),
                    ),
                  ),
                  CustomTFF(
                    title: "Subtitle",
                    field: TextFormField(
                      controller: subTitle,
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
                            controller: scale,
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
                            controller: taal,
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
                  CustomTFF(
                    title: "Video Url",
                    field: TextFormField(
                      controller: videoUrl,
                      decoration: InputDecoration(
                        hintText: "Enter Video Url",
                        border: OutlineInputBorder(),
                        filled: true,
                        fillColor: Colors.grey[350],
                      ),
                    ),
                  ),
                  CustomTFF(
                    title: "Tutorial Url",
                    field: TextFormField(
                      controller: tutorialUrl,
                      decoration: InputDecoration(
                        hintText: "Enter Tutorial Url",
                        border: OutlineInputBorder(),
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
                            child: TabBarView(
                              children: [
                                DefaultTabController(
                                  length: 2,
                                  child: Column(
                                    children: [
                                      Container(
                                        margin: EdgeInsets.all(15),
                                        child: TabBar(
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
                                              controller:
                                                  _chordLyricsEngController,
                                            ),
                                            QuillEditorColumn(
                                              controller:
                                                  _chordLyricsController,
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
                                        margin: EdgeInsets.all(15),
                                        child: TabBar(
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
                                              controller: _lyricsEngController,
                                            ),
                                            QuillEditorColumn(
                                              controller: _lyricsController,
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
