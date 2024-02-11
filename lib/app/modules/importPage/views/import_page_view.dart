import 'dart:ffi';

import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/import_page_controller.dart';

class ImportPageView extends GetView<ImportPageController> {
  const ImportPageView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((){
      return Scaffold(
        body: Container(
          padding: const EdgeInsets.only(left: 10,right: 10),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                Padding(
                  padding: const EdgeInsets.all(20.0), // 设置外边距为20.0
                  child: Row(
                    children: [
                      Text(controller.titleName.value),
                      Expanded(
                          flex:1,
                          child:Container(
                            margin:const EdgeInsets.only(left: 10.0),
                            height: 50.0,
                            child: TextField(
                              controller: controller.tradeNameController,
                                onChanged:(value){
                                  controller.tradeName.value = value;
                                },
                                decoration:const InputDecoration(
                                  hintText: "商品名称", // 提示词
                                  border: OutlineInputBorder(), // 带边框
                                )
                            ),
                          )
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child:Row(
                    children: [
                      const Text("生产日期"),
                      Expanded(
                          flex:1,
                          child:Container(
                            margin:const EdgeInsets.only(left: 10.0),
                            height: 50.0,
                            child: TextField(
                               controller: controller.createDateController,
                                onChanged: (value){
                                  controller.createDate.value = value;
                                },
                                decoration: const InputDecoration(
                                  hintText: "生产日期 2024-2-11", // 提示词
                                  border: OutlineInputBorder(), // 带边框
                                )
                            ),
                          )
                      )
                    ],
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.all(20.0),
                    child:Row(
                      children: [
                        const Text("保质期     "),
                        Expanded(
                            flex:1,
                            child:Container(
                              margin:const EdgeInsets.only(left: 10.0),
                              height: 50.0,
                              child: TextField(
                                  controller: controller.warrantyController,
                                  onChanged:(value){
                                    controller.warranty.value = value;
                                  },
                                  decoration: const InputDecoration(
                                    hintText: "月份 2", // 提示词
                                    border: OutlineInputBorder(), // 带边框
                                  )
                              ),
                            )
                        )
                      ],
                    )
                ),

                Padding(
                  padding:  EdgeInsets.all(20.0),
                  child: ElevatedButton(
                      onPressed:(){
                        controller.tradeName.value = "";
                        controller.createDate.value = "";
                        controller.warranty.value = "";
                        controller.tradeNameController.clear();
                        controller.createDateController.clear();
                        controller.warrantyController.clear();

                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue, // 设置按钮背景颜色为蓝色
                      ),
                      child:const Text("提交录入商品",style: TextStyle(color:Colors.white),)
                  ),
                )

              ]
          ),
        ),
      );
    });
  }
}
