import 'dart:convert';

import './databaseItem.dart';

Bhajan bhajanFromMap(String id, String str) =>
    Bhajan.fromMap(id, json.decode(str));

String bhajanToMap(Bhajan data) => json.encode(data.toMap());

class Bhajan extends DatabaseItem {
  Bhajan({
    this.id,
    this.uid,
    required this.title,
    required this.subTitle,
    required this.scale,
    required this.taal,
    required this.lyrics,
    required this.lyricsChords,
    required this.updateDate,
  }) : super(id);

  final String? id;
  final String title;
  final String subTitle;
  final String scale;
  final String taal;
  final int? uid;

  final String lyrics;
  final String lyricsChords;
  final DateTime updateDate;

  factory Bhajan.fromMap(String id, Map<String, dynamic> json) => Bhajan(
        id: id,
        uid: json["uid"],
        title: json["title"],
        subTitle: json["subTitle"],
        scale: json["scale"],
        taal: json["taal"],
        lyricsChords: json["lyricsChords"],
        lyrics: json["lyrics"],
        updateDate: DateTime.parse(json["updateDate"]),
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "uid": uid,
        "title": title,
        "subTitle": subTitle,
        "scale": scale,
        "taal": taal,
        "lyrics": lyrics,
        "lyricsChords": lyricsChords,
        "updateDate":
            "${updateDate.year.toString().padLeft(4, '0')}-${updateDate.month.toString().padLeft(2, '0')}-${updateDate.day.toString().padLeft(2, '0')}",
      };
}
