

import 'dart:developer';

import 'package:bhajan_web/models/models.dart';

class Utils {
  static bool isChord(DbQuill quill) {
    if (quill.insert['attributes'] == null) {
      return false;
    } else if (quill.insert['attributes']['color'] == null) {
      return false;
    } else {
      return true;
    }
  }
  static bool isWhiteSpace(DbQuill quill) {
    String? insertString = quill.insert['insert'];
    final bool result = insertString == null || insertString.trim() == '';
    log("$insertString --> $result");
    return result;
  }
  static bool isNewLineOnly(DbQuill quill) {
    String? insertString = quill.insert['insert'];
    final bool result = insertString == null || insertString == '\n';
    log("$insertString --> $result");
    return result;
  }

}
