import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:get/get.dart';

class ListPageController extends GetxController {
  //TODO: Implement ListPageController

  RxString titleName = "生产日期".obs;
  RxList<dynamic> listData = <dynamic>[].obs;
  final dio = Dio();

  @override
  void onInit() {
    super.onInit();
    getList();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  getList() async {
    final response = await dio.get('http://114.115.218.92:3010/query');
    Map<String, dynamic> jsonData = json.decode(response.toString());
    listData.value = jsonData["data"];
    return jsonData["data"];
  }

  void delItem(id) async {
    final response = await dio.get(
      'http://114.115.218.92:3010/del',
      queryParameters: {"id": id},
    );
    print(response);
    getList();
  }
}
