import 'dart:developer';

import 'package:bhajan_admin/models/models.dart';
import 'package:bhajan_admin/services/services.dart';
import 'package:get/get.dart';

class BhajanController extends GetxController {

  final Rx<List<Bhajan>> _bhajanList = Rx<List<Bhajan>>([]);
  List<Bhajan> get bhajanList => _bhajanList.value;
  final Rx<List<Bhajan>> _chorusList = Rx<List<Bhajan>>([]);
  List<Bhajan> get chorusList => _chorusList.value;
  final Rx<List<Bhajan>> _balChorusList = Rx<List<Bhajan>>([]);
  List<Bhajan> get balChorusList => _balChorusList.value;

  Bhajan? getBhajanById(String id){
    log("Finding Bhajan with id $id");
    var resultList =  bhajanList.where((e) => e.id == id).toList();
    if(resultList.isEmpty){
      return null;
    }else{
      return resultList[0];
    }
  }

  @override
  void onInit() {
    _bhajanList.bindStream(BhajanService.getBhajans());
    _chorusList.bindStream(ChorusService.getBhajans());
    _balChorusList.bindStream(BalChorusService.getBhajans());
    super.onInit();
  }

}