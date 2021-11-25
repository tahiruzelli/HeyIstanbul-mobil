import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/controllers/location_list_controller.dart';
import 'package:hey_istanbullum/globals/widgets/app_bar.dart';
import 'package:hey_istanbullum/views/mainPage/main_page.dart';

class LocationListPage extends StatelessWidget {
  double cardWidth = Get.width - 50;
  LocationListController locationListController =
      Get.put(LocationListController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Nereye gitmek istersin'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                locationListController.getIsparkLocations();
                Get.to(MainPage());
              },
              child: Card(
                child: SizedBox(
                  width: cardWidth,
                  child: const Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: Text('Ispark'),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
