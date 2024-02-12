import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
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

  final dio = Dio();

  void handleSubmit() async {
    if (tradeName.value.isEmpty ||
        createDate.value.isEmpty ||
        warranty.value.isEmpty) {
      Fluttertoast.showToast(
          msg: "选项不能为空",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.red,
          textColor: Colors.white,
          fontSize: 16.0);
      return null;
    }
    if (createDate.value.contains('。')) {
      // 如果包含句号，删除句号
      createDate.value = createDate.value.replaceAll('。', '');
    }
    final response = await dio.get(
      'http://114.115.218.92:3010/add',
      queryParameters: {
        "tradeName": tradeName.value,
        "warranty": warranty.value,
        "createDate": createDate.value
      },
    );
    Map<String, dynamic> jsonData = json.decode(response.toString());
    if (jsonData["code"] == 101) {
      tradeNameController.clear();
      createDateController.clear();
      warrantyController.clear();
      Fluttertoast.showToast(
          msg: "提交完成",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    } else {
      Fluttertoast.showToast(
          msg: "提交失败,重试",
          toastLength: Toast.LENGTH_SHORT,
          gravity: ToastGravity.CENTER,
          timeInSecForIosWeb: 1,
          backgroundColor: Colors.black,
          textColor: Colors.white,
          fontSize: 16.0);
    }
  }

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
