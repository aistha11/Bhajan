import 'package:bhajan/views/balChorus/balChorusView.dart';
import 'package:bhajan/views/bhajan/bhajanView.dart';
import 'package:bhajan/views/chorus/chorusView.dart';
import 'package:bhajan/views/newSongs/newSongsView.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Bhajan App"),
          bottom: TabBar(
            tabs: [
              Tab(
                text: "Bhajan",
              ),
              Tab(
                text: "Chorus",
              ),
              Tab(
                text: "Bal-Chorus",
              ),
              Tab(
                text: "New Songs",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BhajanView(),
            ChorusView(),
            BalChorusView(),
            NewSongsView()
          ],
        ),
      ),
    );
  }
}
