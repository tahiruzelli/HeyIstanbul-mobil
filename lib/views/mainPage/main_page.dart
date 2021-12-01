import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/controllers/main_controller.dart';
import 'package:hey_istanbullum/globals/widgets/app_bar.dart';
import 'package:hey_istanbullum/globals/widgets/bottom_navigation_bar.dart';

class MainPage extends StatelessWidget {
  MainController mainController = Get.put(MainController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Hey Istanbul'),
      bottomNavigationBar: buildBottomNavigationBar(),
      body: Obx(
          () => mainController.mainPages[mainController.selectedIndex.value]),
    );
  }
}
