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
            child: RefreshIndicator(
              onRefresh: (){
                return controller.getList();
              },
              child: ListView(
                // children: [
                //   itemContainer(0),
                // ],
                children: controller.listData
                    .map((element) => itemContainer(element))
                    .toList()
                    .cast<Widget>(),
              ),
            ),
          )
        ],
      ));
    });
  }

  itemContainer(item) {
    return SwipeActionCell(

        /// 这个key是必要的
        key: ValueKey(item["id"]),
        trailingActions: <SwipeAction>[
          SwipeAction(
              title: "删除",
              onTap: (CompletionHandler handler) async {
                controller.delItem(item["id"]);
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
                child: Text("商品名称: ${item['commodityName']}",
                    style: TextStyle(fontSize: 18)),
                padding: const EdgeInsets.only(bottom: 10),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text(
                        "${controller.titleName.value}: ${item['createDateTxt']}",
                        style: TextStyle(fontSize: 16)),
                  ),
                  Expanded(
                    flex: 1,
                    child: Text("截止日期: ${item['endDateTxt']}",
                        style: TextStyle(fontSize: 16)),
                  )
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 1,
                    child: Text("保质期: ${item['month']} 个月",
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
