import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class ListPageController extends GetxController {
  //TODO: Implement ListPageController

  TextEditingController queryInputController = TextEditingController();
  RxString queryValue = "".obs;

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
    final response = await dio.get('http://49.235.118.199:3010/query');
    Map<String, dynamic> jsonData = json.decode(response.toString());
    listData.value = jsonData["data"];
    return jsonData["data"];
  }

  void delItem(id) async {
    final response = await dio.get(
      'http://49.235.118.199:3010/del',
      queryParameters: {"id": id},
    );
    print(response);
    getList();
  }

  void queryFillFun() async {
    if (queryValue.value.isEmpty) {
      getList();
    } else {
      final response = await dio.get(
        'http://49.235.118.199:3010/queryFill',
        queryParameters: {"name": queryValue.value},
      );
      Map<String, dynamic> jsonData = json.decode(response.toString());
      listData.value = jsonData["data"];
    }
  }
}
