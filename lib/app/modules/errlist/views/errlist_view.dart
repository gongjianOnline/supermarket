import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/errlist_controller.dart';
import 'package:flutter_swipe_action_cell/flutter_swipe_action_cell.dart';

class ErrlistView extends GetView<ErrlistController> {
  const ErrlistView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return Scaffold(
          body: Column(
        children: [
          Expanded(
            flex: 1,
            child: ListView(
              children: controller.listData
                  .map((element) => itemContainer(element))
                  .toList()
                  .cast<Widget>(),
            ),
          )
        ],
      ));
    });
  }

  itemContainer(itemData) {
    return SwipeActionCell(

        /// 这个key是必要的
        key: ValueKey(itemData["id"]),
        trailingActions: <SwipeAction>[
          SwipeAction(
              title: "已处理",
              onTap: (CompletionHandler handler) async {
                controller.delItem(itemData["id"]);
              },
              color: Colors.red),
        ],
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: Colors.red, // 边框颜色
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
                child: Text("商品名称: ${itemData['commodityName']}",
                    style: TextStyle(fontSize: 18)),
                padding: const EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                        "${controller.titleName.value}: ${itemData["createDateTxt"]}",
                        style: TextStyle(fontSize: 16)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("截止日期: ${itemData["endDateTxt"]}",
                        style: TextStyle(fontSize: 16)),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("保质期: ${itemData["month"]} 个月",
                        style: TextStyle(fontSize: 16)),
                  ),
                  Expanded(flex: 1, child: Container())
                ],
              )
            ],
          ),
        ));
  }
}
