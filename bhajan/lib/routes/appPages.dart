import 'package:bhajan/views/home/homeView.dart';
import 'package:get/get.dart';

part 'appRoutes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
    ),
  ];

}