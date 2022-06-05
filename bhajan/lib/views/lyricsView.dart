import 'dart:convert';

import 'package:bhajan/models/models.dart';
import 'package:bhajan/widgets/customBtSht.dart';
import 'package:bhajan/widgets/myText.dart';
import 'package:bhajan/widgets/quillLyrics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';
import 'package:get/get.dart';

class LyricsView extends StatefulWidget {
  const LyricsView({
    Key? key,
    required this.bhajan,
    // required this.catId,
  }) : super(key: key);
  final Bhajan bhajan;
  // final String catId;
  @override
  State<LyricsView> createState() => _LyricsViewState();
}

class _LyricsViewState extends State<LyricsView> {
  bool showChord = true;
  bool showEng = false;
  QuillController _chordLyricsController = QuillController.basic();
  QuillController _lyricsController = QuillController.basic();
  QuillController _chordLyricsEngController = QuillController.basic();
  QuillController _lyricsEngController = QuillController.basic();

  @override
  void initState() {
    super.initState();
    _loadChordLyrics(widget.bhajan.lyricsChords);
    _loadLyrics(widget.bhajan.lyrics);
    if (widget.bhajan.lyricsChordsEng != null) {
      _loadChordLyricsEng(widget.bhajan.lyricsChordsEng!);
    }
    if (widget.bhajan.lyricsEng != null) {
      _loadLyricsEng(widget.bhajan.lyricsEng!);
    }
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

  Future<void> _loadChordLyricsEng(String strResult) async {
    final doc = Document.fromJson(jsonDecode(strResult));
    setState(() {
      _chordLyricsEngController = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  Future<void> _loadLyricsEng(String strResult) async {
    final doc = Document.fromJson(jsonDecode(strResult));
    setState(() {
      _lyricsEngController = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  void toggleShowChord(bool val) {
    setState(() {
      showChord = val;
    });
  }

  void toggleShowEng(bool val) {
    setState(() {
      showEng = val;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(text: widget.bhajan.title),
        actions: [
          IconButton(
            onPressed: () {
              Get.bottomSheet(CustomBtSht(
                showChord: showChord,
                toggleShowChord: toggleShowChord,
                showEng: showEng,
                toggleShowEng: toggleShowEng,
              ));
            },
            icon: Icon(Icons.more_vert),
          ),
          SizedBox(
            width: 15,
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
          Expanded(
            child: QuillLyrics(
              controller: getQuillController(),
            ),
          )
        ],
      ),
    );
  }

  QuillController getQuillController() {
    return showChord
        ? showEng
            ? _chordLyricsEngController
            : _chordLyricsController
        : showEng
            ? _lyricsEngController
            : _lyricsController;
  }
}
