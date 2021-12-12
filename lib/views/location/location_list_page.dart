import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/controllers/location_controller.dart';
import 'package:hey_istanbullum/globals/constans/colors.dart';
import 'package:hey_istanbullum/globals/widgets/app_bar.dart';

class LocationListPage extends StatelessWidget {
  double cardWidth = Get.width - 50;
  LocationController locationListController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: myAppBar('Nereye gitmek istersin'),
        body: GridView.count(
          crossAxisCount: 2,
          children: [
            locationCard('Ispark', locationListController.getIsparkLocations,
                'isparkLogo'),
            locationCard('Yol çalışmaları',
                locationListController.getYolCalismalari, 'yolCalismasi'),
            locationCard('Akayakıt Istasyonları',
                locationListController.getAkaryakitIstasyonlari, 'akaryakit'),
            locationCard('Halk Ekmek Büfeleri',
                locationListController.getHalkEkmekBufeleri, 'halkEkmek'),
            locationCard('IBB Wifi Konumları',
                locationListController.getIBBWifiLocations, 'wifi'),
          ],
        ));
  }

  GestureDetector locationCard(String title, function, String iconPath) {
    return GestureDetector(
      onTap: () {
        function();
      },
      child: Stack(
        children: [
          Card(
            child: SizedBox(
              width: cardWidth,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Text(
                    title,
                    style: TextStyle(
                      color: colorErguvan,
                      fontSize: 20,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ),
          ),
          Opacity(
            opacity: 0.1,
            child: Center(child: Image.asset('assets/icons/$iconPath.png')),
          )
        ],
      ),
    );
  }
}
