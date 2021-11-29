import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/controllers/location_list_controller.dart';
import 'package:hey_istanbullum/globals/widgets/app_bar.dart';

class LocationListPage extends StatelessWidget {
  double cardWidth = Get.width - 50;
  LocationListController locationListController = Get.find();
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
              },
              child: Card(
                child: SizedBox(
                  width: cardWidth,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: Text('Ispark'),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                locationListController.getYolCalismalari();
              },
              child: Card(
                child: SizedBox(
                  width: cardWidth,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: Text('Yol çalışmaları'),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                locationListController.getAkaryakitIstasyonlari();
              },
              child: Card(
                child: SizedBox(
                  width: cardWidth,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: Text('Akayakıt Istasyonları'),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                locationListController.getHalkEkmekBufeleri();
              },
              child: Card(
                child: SizedBox(
                  width: cardWidth,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: Text('Halk Ekmek Büfeleri'),
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                locationListController.getIBBWifiLocations();
              },
              child: Card(
                child: SizedBox(
                  width: cardWidth,
                  child: const Padding(
                    padding: EdgeInsets.symmetric(vertical: 20.0),
                    child: Center(
                      child: Text('IBB Wifi Konumları'),
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
