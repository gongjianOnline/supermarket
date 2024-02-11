import 'package:get/get.dart';

import '../controllers/home_controller.dart';
import '../../importPage/controllers/import_page_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<ImportPageController>(
      () => ImportPageController(),
    );
  }
}
