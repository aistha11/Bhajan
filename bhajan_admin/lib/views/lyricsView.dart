import 'dart:convert';

import 'package:bhajan_admin/controllers/controllers.dart';
import 'package:bhajan_admin/models/bhajan.dart';
import 'package:bhajan_admin/models/models.dart';
import 'package:bhajan_admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class LyricsView extends StatefulWidget {
  const LyricsView({Key? key, required this.bhajan, required this.catId})
      : super(key: key);
  final Bhajan bhajan;
  final String catId;
  @override
  State<LyricsView> createState() => _LyricsViewState();
}

class _LyricsViewState extends State<LyricsView> {
  bool showChord = true;
  QuillController _chordLyricsController = QuillController.basic();
  QuillController _lyricsController = QuillController.basic();
  bool readOnly = false;
  @override
  void initState() {
    super.initState();
    _loadChordLyrics(widget.bhajan.lyricsChords);
    _loadLyrics(widget.bhajan.lyrics);
  }

  Future<void> _loadChordLyrics(String strResult) async {
    final doc = Document.fromJson(jsonDecode(strResult));
    setState(() {
      _chordLyricsController = QuillController(
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

  void toggle(bool val) {
    setState(() {
      showChord = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(text: widget.bhajan.title),
        actions: [
          Center(
              child: MyText(
            text: !showChord ? "Show Chord" : "Hide Chord",
          )),
          Checkbox(
              value: showChord,
              onChanged: (val) {
                toggle(val!);
              }),
          SizedBox(
            width: 15,
          ),
          IconButton(
            onPressed: () {
              Get.find<BhajanController>().updateBhajan(
                chordLyricsController: _chordLyricsController,
                lyricsController: _lyricsController,
                bhajan: widget.bhajan,
                catId: widget.catId,
              );
            },
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                    children: [
                      TextSpan(text: "Scale "),
                      TextSpan(
                          text: "${widget.bhajan.scale},    ",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
                RichText(
                  text: TextSpan(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 24,
                    ),
                    children: [
                      TextSpan(text: "Taal "),
                      TextSpan(
                          text: widget.bhajan.taal,
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),
              ],
            ),
          ),
          showChord
              ? QuillToolbar.basic(
                  controller: _chordLyricsController,
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
                )
              : QuillToolbar.basic(
                  controller: _lyricsController,
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
            child: showChord
                ? QuillEditor(
                    controller: _chordLyricsController,
                    readOnly: readOnly,
                    scrollController: ScrollController(),
                    scrollable: true,
                    focusNode: FocusNode(canRequestFocus: true),
                    autoFocus: true,
                    expands: false,
                    padding: EdgeInsets.all(20),
                  )
                : QuillEditor(
                    controller: _lyricsController,
                    readOnly: readOnly,
                    scrollController: ScrollController(),
                    scrollable: true,
                    focusNode: FocusNode(canRequestFocus: true),
                    autoFocus: true,
                    expands: false,
                    padding: EdgeInsets.all(20),
                  ),
          )
        ],
      ),
    );
  }
}
