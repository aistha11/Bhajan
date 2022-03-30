import 'dart:convert';

import './databaseItem.dart';



Bhajan bhajanFromMap(String id,String str) => Bhajan.fromMap(id,json.decode(str));

String bhajanToMap(Bhajan data) => json.encode(data.toMap());

class Bhajan extends DatabaseItem{
    Bhajan({
        this.id,
        required this.title,
        required this.scale,
        required this.taal,
        required this.content,
        required this.updateDate,
    }):super(id);

    final String? id;
    final String title;
    final String scale;
    final String taal;
    final String content;
    final DateTime updateDate;

    factory Bhajan.fromMap(String id, Map<String, dynamic> json) => Bhajan(
        id: id,
        title: json["title"],
        scale: json["scale"],
        taal: json["taal"],
        content: json["content"],
        updateDate: DateTime.parse(json["updateDate"]),
    );

    Map<String, dynamic> toMap() => {
        "title": title,
        "scale": scale,
        "taal": taal,
        "content": content,
        "updateDate": "${updateDate.year.toString().padLeft(4, '0')}-${updateDate.month.toString().padLeft(2, '0')}-${updateDate.day.toString().padLeft(2, '0')}",
    };
}
