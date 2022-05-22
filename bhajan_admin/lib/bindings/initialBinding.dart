import 'package:bhajan_admin/controllers/bhajanController.dart';
import 'package:bhajan_admin/controllers/firebaseAuthController.dart';
import 'package:get/get.dart';

class InitialBinding implements Bindings {
@override
void dependencies() {
  Get.put<FirebaseAuthController>(FirebaseAuthController());
  Get.put<BhajanController>(BhajanController());


  }
}