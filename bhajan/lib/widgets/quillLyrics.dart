import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuillLyrics extends StatelessWidget {
  const QuillLyrics({Key? key, required this.controller}) : super(key: key);

  final QuillController controller;

  @override
  Widget build(BuildContext context) {
    return QuillEditor(
      controller: controller,
      readOnly: true,
      scrollController: ScrollController(),
      scrollable: true,
      focusNode: FocusNode(canRequestFocus: false),
      autoFocus: true,
      expands: false,
      padding: EdgeInsets.all(20),
    );
  }
}
