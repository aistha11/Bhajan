import 'package:bhajan/controllers/bhajanController.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
@override
void dependencies() {
  Get.put<BhajanController>(BhajanController());
  }
}