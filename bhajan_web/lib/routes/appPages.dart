import 'package:bhajan_web/bindings/bindings.dart';
import 'package:bhajan_web/bindings/initialBinding.dart';
import 'package:bhajan_web/views/views.dart';
import 'package:bhajan_web/views/wrapper.dart';
import 'package:get/get.dart';

part 'appRoutes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const Wrapper(),
      binding: InitialBinding(),
    ),
    GetPage(
      name: Routes.ADDBHAJAN,
      page: () => AddBhajan(),
      binding: AddBhajanBinding()
    ),
  ];

  static final unknownRoute = GetPage(name: '/not-found', page: ()=>const NotFoundView());
}
