import 'package:bhajan_web/controllers/controllers.dart';
import 'package:get/get.dart';

class AddBhajanBinding implements Bindings {
@override
void dependencies() {
  Get.put<AddBhajanController>(AddBhajanController());
  }
}