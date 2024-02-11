import 'package:get/get.dart';

import '../modules/errlist/bindings/errlist_binding.dart';
import '../modules/errlist/views/errlist_view.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/importPage/bindings/import_page_binding.dart';
import '../modules/importPage/views/import_page_view.dart';
import '../modules/listPage/bindings/list_page_binding.dart';
import '../modules/listPage/views/list_page_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.IMPORT_PAGE,
      page: () => const ImportPageView(),
      binding: ImportPageBinding(),
    ),
    GetPage(
      name: _Paths.LIST_PAGE,
      page: () => const ListPageView(),
      binding: ListPageBinding(),
    ),
    GetPage(
      name: _Paths.ERRLIST,
      page: () => const ErrlistView(),
      binding: ErrlistBinding(),
    ),
  ];
}
