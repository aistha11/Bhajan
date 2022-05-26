import 'package:bhajan_web/controllers/bhajanController.dart';
import 'package:bhajan_web/controllers/firebaseAuthController.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
@override
void dependencies() {
  Get.put<FirebaseAuthController>(FirebaseAuthController());
  Get.put<BhajanController>(BhajanController());


  }
}