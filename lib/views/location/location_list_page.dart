import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/controllers/location_controller.dart';
import 'package:hey_istanbullum/globals/widgets/app_bar.dart';

class LocationListPage extends StatelessWidget {
  double cardWidth = Get.width - 50;
  LocationController locationListController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: myAppBar('Nereye gitmek istersin'),
      body: SingleChildScrollView(
        child: Column(
          children: [
            locationCard('Ispark', locationListController.getIsparkLocations),
            locationCard(
                'Yol çalışmaları', locationListController.getYolCalismalari),
            locationCard('Akayakıt Istasyonları',
                locationListController.getAkaryakitIstasyonlari),
            locationCard('Halk Ekmek Büfeleri',
                locationListController.getHalkEkmekBufeleri),
            locationCard('IBB Wifi Konumları',
                locationListController.getIBBWifiLocations),
          ],
        ),
      ),
    );
  }

  Align locationCard(String title, function) {
    return Align(
      alignment: Alignment.center,
      child: GestureDetector(
        onTap: () {
          function();
        },
        child: Card(
          child: SizedBox(
            width: cardWidth,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Center(
                child: Text(title),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
