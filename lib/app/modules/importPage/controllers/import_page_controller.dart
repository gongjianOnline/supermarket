import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class ImportPageController extends GetxController {
  //TODO: Implement ImportPageController

  TextEditingController tradeNameController = TextEditingController();
  TextEditingController createDateController = TextEditingController();
  TextEditingController warrantyController = TextEditingController();

  RxString titleName = "商品名称".obs;
  RxString tradeName = "".obs;
  RxString createDate = "".obs;
  RxString warranty = "".obs;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

}
