import 'dart:developer';

import 'package:bhajan/controllers/bhajanController.dart';
import 'package:bhajan/models/bhajan.dart';
import 'package:bhajan/views/balChorus/balChorusView.dart';
import 'package:bhajan/views/bhajan/bhajanView.dart';
import 'package:bhajan/views/chorus/chorusView.dart';
import 'package:bhajan/views/lyricsView.dart';
import 'package:bhajan/views/newSongs/newSongsView.dart';
import 'package:bhajan/widgets/customAlert.dart';
import 'package:bhajan/widgets/customBalChorusSearch.dart';
import 'package:bhajan/widgets/customBhajanSearch.dart';
import 'package:bhajan/widgets/customChorusSearch.dart';
import 'package:bhajan/widgets/customNewSongsSearch.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 4);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Bhajan"),
        bottom: TabBar(
          controller: _tabController,
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
        actions: [
          IconButton(
            onPressed: () {
              switch (_tabController.index) {
                case 0:
                  showSearch(
                    context: context,
                    delegate: CustomBhajanSearch(),
                  );
                  break;
                case 1:
                  showSearch(
                    context: context,
                    delegate: CustomChorusSearch(),
                  );
                  break;
                case 2:
                  showSearch(
                    context: context,
                    delegate: CustomBalChorusSearch(),
                  );
                  break;
                case 3:
                  showSearch(
                    context: context,
                    delegate: CustomNewSongsSearch(),
                  );
                  break;
                default:
                  log("Invalid index");
              }
            },
            icon: Icon(Icons.search),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [BhajanView(), ChorusView(), BalChorusView(), NewSongsView()],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()async {
           String? id = await Get.dialog<String>(
            CustomAlert(
              last: getLast(),
              title: getTitle(),
            ),
          );
          if(id==null || id == ""){
            return;
          }
          Bhajan? bhajan = getBhajanById(id);
          if (bhajan == null) {
            return;
          }
          Get.to(()=>LyricsView(bhajan: bhajan));
        },
        child: Text(
          "#",
          style: TextStyle(fontSize: 22),
        ),
      ),
    );
  }

  int getLast(){
    switch (_tabController.index) {
      case 0:
        return Get.find<BhajanController>().bhajanList.length;
      case 1:
        return Get.find<BhajanController>().chorusList.length;
      case 2:
        return Get.find<BhajanController>().balChorusList.length;
      case 3:
        return Get.find<BhajanController>().newSongsList.length;
      default:
        return 1;
    }
  }
  String getTitle(){
    switch (_tabController.index) {
      case 0:
        return "Bhajan";
      case 1:
        return "Chorus";
      case 2:
        return "Bal-Chorus";
      case 3:
        return "New Songs";
      default:
        return "";
    }
  }
  Bhajan? getBhajanById(String id){
    switch (_tabController.index) {
      case 0:
        return Get.find<BhajanController>().getBhajanById(id);
      case 1:
        return Get.find<BhajanController>().getChorusById(id);
      case 2:
        return Get.find<BhajanController>().getBalChorusById(id);
      case 3:
        return Get.find<BhajanController>().getNewSongsById(id);
      default:
       return null; 
    }
  }
}
