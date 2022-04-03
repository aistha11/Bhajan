import 'package:bhajan_admin/views/balChorus/balChorusView.dart';
import 'package:bhajan_admin/views/bhajan/bhajanView.dart';
import 'package:bhajan_admin/views/chorus/chorusView.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bhajan Dashboard"),
          bottom: TabBar(
            tabs: const [
              Tab(
                text: "Bhajan",
              ),
              Tab(
                text: "Chorus",
              ),
              Tab(
                text: "Bal-Chorus",
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            BhajanView(),
            ChorusView(),
            BalChorusView(),
          ],
        ),
      ),
    );
  }
}
