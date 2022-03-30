import 'package:bhajan_admin/routes/appPages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
            Scaffold(
              body: Center(
                child: Text("Bhajan"),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(Routes.ADDBHAJAN, arguments: {"cat": 1});
                },
                child: const Icon(Icons.add),
              ),
            ),
            Scaffold(
              body: Center(
                child: Text("Chorus"),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(Routes.ADDBHAJAN, arguments: {"cat": 2});
                },
                child: const Icon(Icons.add),
              ),
            ),
            Scaffold(
              body: Center(
                child: Text("Bal Chorus"),
              ),
              floatingActionButton: FloatingActionButton(
                onPressed: () {
                  Get.toNamed(Routes.ADDBHAJAN, arguments: {"cat": 3});
                },
                child: const Icon(Icons.add),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
