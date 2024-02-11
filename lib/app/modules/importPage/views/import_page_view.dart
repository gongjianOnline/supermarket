import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/import_page_controller.dart';

class ImportPageView extends GetView<ImportPageController> {
  const ImportPageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Center(
        child: Text(
          'ImportPageView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
