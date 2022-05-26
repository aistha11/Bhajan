import 'package:badges/badges.dart';
import 'package:bhajan_web/controllers/controllers.dart';
import 'package:bhajan_web/views/balChorus/balChorusView.dart';
import 'package:bhajan_web/views/bhajan/bhajanView.dart';
import 'package:bhajan_web/views/chorus/chorusView.dart';
import 'package:bhajan_web/views/newSongs/newSongsView.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';


class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Bhajan Dashboard"),
          bottom: TabBar(
            tabs: [
              Badge(
                badgeContent: GetX<BhajanController>(
                  
                  builder: (bhajanController) {
                    return Text("${bhajanController.bhajanList.length}");
                  },
                ),
                badgeColor: Colors.blue,
                child: const Tab(
                  text: "Bhajan",
                ),
              ),
              Badge(
                badgeContent: GetX<BhajanController>(
                  
                  builder: (bhajanController) {
                    return Text("${bhajanController.chorusList.length}");
                  },
                ),
                badgeColor: Colors.blue,
                child: const Tab(
                  text: "Chorus",
                ),
              ),
              Badge(
                badgeContent: GetX<BhajanController>(
                  
                  builder: (bhajanController) {
                    return Text("${bhajanController.balChorusList.length}");
                  },
                ),
                badgeColor: Colors.blue,
                child: const Tab(
                  text: "Bal-Chorus",
                ),
              ),
              Badge(
                badgeContent: GetX<BhajanController>(
                  
                  builder: (bhajanController) {
                    return Text("${bhajanController.newSongsList.length}");
                  },
                ),
                badgeColor: Colors.blue,
                child: const Tab(
                  text: "New Songs",
                ),
              ),
              
            ],
          ),
        ),
        body: TabBarView(
          physics: const NeverScrollableScrollPhysics(),
          children: [
            BhajanView(),
            const ChorusView(),
            const BalChorusView(),
            const NewSongsView(),
          ],
        ),
      ),
    );
  }
}
