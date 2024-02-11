import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/list_page_controller.dart';

class ListPageView extends GetView<ListPageController> {
  const ListPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'ListPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
