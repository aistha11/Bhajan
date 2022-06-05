import 'package:bhajan_admin/bindings/bindings.dart';
// import 'package:bhajan_admin/bindings/initialBinding.dart';
import 'package:bhajan_admin/views/views.dart';
import 'package:bhajan_admin/views/wrapper.dart';
import 'package:get/get.dart';

part 'appRoutes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => Wrapper(),
      // binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.ADDBHAJAN,
      page: () => AddBhajan(),
      binding: AddBhajanBinding()
    ),
  ];

  static final unknownRoute = GetPage(name: '/not-found', page: ()=>NotFoundView());
}
