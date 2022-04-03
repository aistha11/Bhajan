

import 'package:bhajan_admin/models/models.dart';

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

}
