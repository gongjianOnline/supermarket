import 'package:get/get.dart';

import '../controllers/import_page_controller.dart';

class ImportPageBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ImportPageController>(
      () => ImportPageController(),
    );
  }
}
