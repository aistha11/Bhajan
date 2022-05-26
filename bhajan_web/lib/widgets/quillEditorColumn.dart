import 'package:flutter/material.dart';
import 'package:flutter_quill/flutter_quill.dart';

class QuillEditorColumn extends StatelessWidget {
  const QuillEditorColumn({Key? key, required this.controller})
      : super(key: key);
  final QuillController controller;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        QuillToolbar.basic(
          controller: controller,
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
            margin: const EdgeInsets.all(18),
            child: Padding(
              padding: const EdgeInsets.all(18.0),
              child: QuillEditor.basic(
                controller: controller,
                readOnly: false, // true for view only mode
              ),
            ),
          ),
        ),
      ],
    );
  }
}