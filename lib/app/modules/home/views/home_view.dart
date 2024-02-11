import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
          appBar: AppBar(
            title: Text(
              "${controller.titleName}",
              style:const TextStyle(
                color: Colors.white
              ),
            ),
            centerTitle: true,
            backgroundColor: Colors.blue,
          ),
          bottomNavigationBar: BottomNavigationBar(
              type:BottomNavigationBarType.fixed,
              selectedItemColor:Colors.blue,
              currentIndex:controller.menuIndex.value,
              onTap:(index){
                controller.handleMenuChange(index);
                // 打印当前点击图标的下标
              },
              items:const [
                BottomNavigationBarItem(
                    icon:Icon(Icons.border_color_outlined),
                    label:"录入"
                ),
                BottomNavigationBarItem(
                    icon:Icon(Icons.format_list_bulleted),
                    label:"列表"
                ),
                BottomNavigationBarItem(
                    icon:Icon(Icons.error_outlined),
                    label:"警告"
                )
              ]
          ),
          body: controller.menuList[controller.menuIndex.value],
        );
    });
  }
}
