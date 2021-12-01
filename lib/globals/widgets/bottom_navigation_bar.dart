import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/controllers/main_controller.dart';

Obx buildBottomNavigationBar() {
  MainController mainController = Get.find();
  return Obx(
    () => BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: mainController.selectedIndex.value,
      onTap: (value) {
        mainController.selectedIndex.value = value;
      },
      items: const [
        BottomNavigationBarItem(icon: Icon(Icons.map_sharp), label: "Harita"),
        BottomNavigationBarItem(
            icon: Icon(Icons.favorite), label: "Favorilerim"),
        BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profilim"),
      ],
    ),
  );
}
