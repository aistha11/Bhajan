import 'package:badges/badges.dart';
import 'package:bhajan_admin/controllers/controllers.dart';
import 'package:bhajan_admin/views/balChorus/balChorusView.dart';
import 'package:bhajan_admin/views/bhajan/bhajanView.dart';
import 'package:bhajan_admin/views/chorus/chorusView.dart';
import 'package:bhajan_admin/views/newSongs/newSongsView.dart';
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
                child: Tab(
                  text: "Bhajan",
                ),
                badgeContent: GetX<BhajanController>(
                  
                  builder: (bhajanController) {
                    return Text("${bhajanController.bhajanList.length}");
                  },
                ),
                badgeColor: Colors.blue,
              ),
              Badge(
                child: Tab(
                  text: "Chorus",
                ),
                badgeContent: GetX<BhajanController>(
                  
                  builder: (bhajanController) {
                    return Text("${bhajanController.chorusList.length}");
                  },
                ),
                badgeColor: Colors.blue,
              ),
              Badge(
                child: Tab(
                  text: "Bal-Chorus",
                ),
                badgeContent: GetX<BhajanController>(
                  
                  builder: (bhajanController) {
                    return Text("${bhajanController.balChorusList.length}");
                  },
                ),
                badgeColor: Colors.blue,
              ),
              Badge(
                child: Tab(
                  text: "New Songs",
                ),
                badgeContent: GetX<BhajanController>(
                  
                  builder: (bhajanController) {
                    return Text("${bhajanController.newSongsList.length}");
                  },
                ),
                badgeColor: Colors.blue,
              ),
              
            ],
          ),
        ),
        body: TabBarView(
          physics: NeverScrollableScrollPhysics(),
          children: [
            BhajanView(),
            ChorusView(),
            BalChorusView(),
            NewSongsView(),
          ],
        ),
      ),
    );
  }
}
