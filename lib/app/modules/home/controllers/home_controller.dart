import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import '../../errlist/views/errlist_view.dart';
import '../../importPage/views/import_page_view.dart';
import '../../listPage/views/list_page_view.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  RxString titleName = "重阳超市".obs;
  /*菜单栏*/
  RxInt menuIndex = 0.obs;
  /*表驱动编程*/
  RxMap menuList =
      {0: ImportPageView(), 1: ListPageView(), 2: ErrlistView()}.obs;
  final dio = Dio();
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

  /*菜单切换*/
  void handleMenuChange(index) => {menuIndex.value = index};

  /**数据库去重操作 */
  void handleDuplicate() async {
    final response = await dio.get('http://49.235.118.199:3010/initDB');
    Fluttertoast.showToast(
        msg: "去重完成,刷新商品列表",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black,
        textColor: Colors.white,
        fontSize: 16.0);
  }
}
