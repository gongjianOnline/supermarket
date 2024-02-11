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
  RxMap menuList = {
    0:ImportPageView(),
    1:ListPageView(),
    2:ErrlistView()
  }.obs;

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
  void handleMenuChange(index)=>{
    menuIndex.value = index
  };

}
