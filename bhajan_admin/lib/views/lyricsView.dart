import 'dart:convert';

import 'package:bhajan_admin/models/bhajan.dart';
import 'package:bhajan_admin/models/models.dart';
import 'package:bhajan_admin/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

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
  QuillController _quillController = QuillController.basic();
  bool readOnly = true;
  @override
  void initState() {
    super.initState();
    _loadFromAssets(widget.bhajan.lyricsChords);
  }

  Future<void> _loadFromAssets(String strResult) async {
    final doc = Document.fromJson(jsonDecode(strResult));
    setState(() {
      _quillController = QuillController(
          document: doc, selection: const TextSelection.collapsed(offset: 0));
    });
  }

  void toggle() {
    setState(() {
      showChord = !showChord;
      if (showChord) {
        _loadFromAssets(widget.bhajan.lyricsChords);
      } else {
        _loadFromAssets(widget.bhajan.lyrics);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: MyText(text: "Lyrics Example Title"),
        actions: [
          IconButton(
            onPressed: () {
              toggle();
            },
            icon: Icon(Icons.hide_source),
          ),
        ],
      ),
      // body: Padding(
      //   padding: const EdgeInsets.only(left: 40, top: 20, right: 10),
      //   child: Scrollbar(
      //     child: GetBuilder<BhajanController>(
      //       builder: (controller) {
      //         var jsonData = jsonDecode(widget.bhajan.lyricsChords);
      //         log(jsonData.toString());

      //         return ListView.builder(
      //           itemCount: 10,
      //           itemBuilder: (_, i) {
      //             return RichText(
      //               textAlign: TextAlign.start,
      //               text: TextSpan(
      //                 style: TextStyle(
      //                   color: Colors.black,
      //                 ),
      //                 children: [
      //                   showChord
      //                       ? TextSpan(
      //                           text: "C       F         G",
      //                           style: TextStyle(
      //                             color: Colors.red,
      //                           ),
      //                         )
      //                       : TextSpan(),
      //                   showChord ? TextSpan(text: "\n") : TextSpan(),
      //                   TextSpan(
      //                     text: "This is a line of a lyrics",
      //                     style: TextStyle(fontSize: 22),
      //                   ),
      //                 ],
      //               ),
      //             );
      //           },
      //         );
      //       },
      //     ),
      //   ),
      // ),
      body: Column(
        children: [
          Expanded(
            child: QuillEditor.basic(
                controller: _quillController, readOnly: true),
          )
        ],
      ),
    );
  }
}
