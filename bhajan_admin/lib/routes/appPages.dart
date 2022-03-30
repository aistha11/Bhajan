import 'package:bhajan_admin/views/views.dart';
import 'package:get/get.dart';

part 'appRoutes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeView(),
    ),
    GetPage(
      name: Routes.ADDBHAJAN,
      page: () => AddBhajan(),
    ),
  ];
}
