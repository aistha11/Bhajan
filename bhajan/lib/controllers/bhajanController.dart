import 'package:bhajan/models/models.dart';
import 'package:bhajan/services/services.dart';
import 'package:get/get.dart';

class BhajanController extends GetxController {

final Rx<List<Bhajan>> _bhajanList = Rx<List<Bhajan>>([]);
  List<Bhajan> get bhajanList => _bhajanList.value;
  final Rx<List<Bhajan>> _chorusList = Rx<List<Bhajan>>([]);
  List<Bhajan> get chorusList => _chorusList.value;
  final Rx<List<Bhajan>> _balChorusList = Rx<List<Bhajan>>([]);
  List<Bhajan> get balChorusList => _balChorusList.value;
  final Rx<List<Bhajan>> _newSongsList = Rx<List<Bhajan>>([]);
  List<Bhajan> get newSongsList => _newSongsList.value;

  Bhajan? getBhajanById(String id){
    try {
      return bhajanList.firstWhere((e) => e.id! == id);
    } catch (e) {
      return null;
    }
  }
  Bhajan? getChorusById(String id){
    try {
      return chorusList.firstWhere((e) => e.id! == id);
    } catch (e) {
      return null;
    }
  }
  Bhajan? getBalChorusById(String id){
    try {
      return balChorusList.firstWhere((e) => e.id! == id);
    } catch (e) {
      return null;
    }
  }
  Bhajan? getNewSongsById(String id){
    try {
      return newSongsList.firstWhere((e) => e.id! == id);
    } catch (e) {
      return null;
    }
  }

  @override
  void onInit() {
    _bhajanList.bindStream(BhajanService.getBhajans());
    _chorusList.bindStream(ChorusService.getBhajans());
    _balChorusList.bindStream(BalChorusService.getBhajans());
    _newSongsList.bindStream(NewSongsService.getBhajans());
    super.onInit();
  }
}