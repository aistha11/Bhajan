import 'package:bhajan/controllers/bhajanController.dart';
import 'package:bhajan/models/bhajan.dart';
import 'package:bhajan/views/lyricsView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomNewSongsSearch extends SearchDelegate {
  List<Bhajan> allData = Get.find<BhajanController>().newSongsList;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.close),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        Get.back();
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    List<Bhajan> matchQuery = [];
    for (var item in allData) {
      if (item.subTitle.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        Bhajan bhajan = matchQuery[index];
        return ListTile(
          leading: Text(bhajan.id.toString()),
          title: Text(
            bhajan.title,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            "${bhajan.subTitle}\nScale: ${bhajan.scale}, Taal: ${bhajan.taal}",
            overflow: TextOverflow.ellipsis,
          ),
          isThreeLine: true,
          onTap: () {
            Get.off(() => LyricsView(
                  // catId: '4',
                  bhajan: bhajan,
                ));
          },
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Bhajan> matchQuery = [];
    for (var item in allData) {
      if (item.subTitle.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(item);
      }
    }
    return ListView.builder(
      itemCount: matchQuery.length,
      itemBuilder: (context, index) {
        Bhajan bhajan = matchQuery[index];
        return ListTile(
          leading: Text(bhajan.id.toString()),
          title: Text(
            bhajan.title,
            overflow: TextOverflow.ellipsis,
          ),
          subtitle: Text(
            "${bhajan.subTitle}\nScale: ${bhajan.scale}, Taal: ${bhajan.taal}",
            overflow: TextOverflow.ellipsis,
          ),
          isThreeLine: true,
          onTap: () {
            Get.off(() => LyricsView(
                  // catId: '4',
                  bhajan: bhajan,
                ));
          },
        );
      },
    );
  }
}
