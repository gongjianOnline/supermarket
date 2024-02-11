import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_page_controller.dart';

class ListPageView extends GetView<ListPageController> {
  const ListPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children:[
              Row()
            ]
        ),
      ),
    );
  }
}
