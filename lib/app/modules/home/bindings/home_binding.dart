import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../importPage/controllers/import_page_controller.dart';
import '../../listPage/controllers/list_page_controller.dart';
import '../../errlist/controllers/errlist_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ImportPageController>(
      () => ImportPageController(),
    );
    Get.lazyPut<ListPageController>(
      () => ListPageController(),
    );
    Get.lazyPut<ErrlistController>(
      () => ErrlistController(),
    );
  }
}
