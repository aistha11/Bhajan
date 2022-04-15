import 'dart:convert';

class DbQuill {
  DbQuill({
    this.insert,
    this.attributes,
  });

  dynamic insert;
  Attributes? attributes;

  factory DbQuill.fromJson(String str) => DbQuill.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory DbQuill.fromMap(Map<String, dynamic> json) => DbQuill(
        insert: json["insert"],
        attributes: json["attributes"] == null
            ? null
            : Attributes.fromMap(json["attributes"]),
      );

  Map<String, dynamic> toMap() {
    return {
      "insert": insert,
      "attributes": attributes == null ? null : attributes!.toMap(),
    };
  }
}

class Attributes {
  Attributes({
    this.width,
    this.style,
    this.header,
    this.italic,
    this.background,
    this.bold,
    this.underline,
    this.color,
    this.strike,
    this.link,
    this.list,
    this.blockquote,
    this.codeBlock,
    this.indent,
    this.align,
    this.font,
    this.size,
    this.token,
  });

  String? width;
  String? style;
  int? header;
  bool? italic;
  String? background;
  bool? bold;
  bool? underline;
  String? color;
  bool? strike;
  String? link;
  ListEnum? list;
  bool? blockquote;
  bool? codeBlock;
  int? indent;
  String? align;
  String? font;
  String? size;
  String? token;

  factory Attributes.fromJson(String str) =>
      Attributes.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Attributes.fromMap(Map<String, dynamic> json) => Attributes(
        width: json["width"],
        style: json["style"],
        header: json["header"],
        italic: json["italic"],
        background: json["background"],
        bold: json["bold"],
        underline: json["underline"],
        color: json["color"],
        strike: json["strike"],
        link: json["link"],
        list: json["list"] == null ? null : listEnumValues.map[json["list"]],
        blockquote: json["blockquote"],
        codeBlock: json["code-block"],
        indent: json["indent"],
        align: json["align"],
        font: json["font"],
        size: json["size"],
        token: json["token"],
      );

  Map<String, dynamic> toMap() => {
        "width": width,
        "style": style,
        "header": header,
        "italic": italic,
        "background": background,
        "bold": bold,
        "underline": underline,
        "color": color,
        "strike": strike,
        "link": link,
        "list": list == null ? null : listEnumValues.reverse[list],
        "blockquote": blockquote,
        "code-block": codeBlock,
        "indent": indent,
        "align": align,
        "font": font,
        "size": size,
        "token": token,
      };
}

enum ListEnum { ORDERED, BULLET, CHECKED, UNCHECKED }

final listEnumValues = EnumValues({
  "bullet": ListEnum.BULLET,
  "checked": ListEnum.CHECKED,
  "ordered": ListEnum.ORDERED,
  "unchecked": ListEnum.UNCHECKED
});

class InsertClass {
  InsertClass({
    this.image,
    this.video,
  });

  String? image;
  String? video;

  factory InsertClass.fromJson(String str) =>
      InsertClass.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory InsertClass.fromMap(Map<String, dynamic> json) => InsertClass(
        image: json["image"],
        video: json["video"],
      );

  Map<String, dynamic> toMap() => {
        "image": image,
        "video": video,
      };
}

class EnumValues<T> {
  Map<String, T> map;
  Map<T, String>? reverseMap;

  EnumValues(this.map);

  Map<T, String> get reverse {
    // ignore: prefer_conditional_assignment
    if (reverseMap == null) {
      reverseMap = map.map((k, v) =>  MapEntry(v, k));
    }
    return reverseMap!;
  }
}