import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_page_controller.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

class ListPageView extends GetView<ListPageController> {
  const ListPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: [
                itemContainer(0),
              ],
            ),
          )
        ],
      ));
    });
  }

  itemContainer(index) {
    return SwipeActionCell(

        /// 这个key是必要的
        key: ValueKey(index),
        trailingActions: <SwipeAction>[
          SwipeAction(
              title: "删除",
              onTap: (CompletionHandler handler) async {
                print(index);
              },
              color: Colors.red),
        ],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.black12, // 边框颜色
              width: 1, // 边框宽度
            ),
          ),
          margin:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          padding:
              const EdgeInsets.only(left: 10, right: 10, top: 10, bottom: 10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: const Text("商品名称: ", style: TextStyle(fontSize: 18)),
                padding: const EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("${controller.titleName.value}: 2024-10-10",
                        style: TextStyle(fontSize: 16)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("截止日期: 2024-10-11",
                        style: TextStyle(fontSize: 16)),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("保质期: 2个月", style: TextStyle(fontSize: 16)),
                  ),
                  Expanded(flex: 1, child: Container())
                ],
              )
            ],
          ),
        ));
  }
}
