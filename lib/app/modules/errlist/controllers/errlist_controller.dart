import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ErrlistController extends GetxController {
  //TODO: Implement ErrlistController

  RxString titleName = "生产日期".obs;
  RxList<dynamic> listData = <dynamic>[].obs;
  final dio = Dio();

  @override
  void onInit() {
    super.onInit();
    getErrList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getErrList() async {
    var response = await dio.get("http://49.235.118.199:3010/err");
    Map<String, dynamic> jsonData = json.decode(response.toString());
    print(jsonData);
    listData.value = jsonData["data"];
    return jsonData;
  }

  void delItem(id) async {
    final response = await dio.get(
      'http://49.235.118.199:3010/del',
      queryParameters: {"id": id},
    );
    getErrList();
  }
}
