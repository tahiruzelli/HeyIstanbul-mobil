import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/controllers/favorite_controller.dart';
import 'package:hey_istanbullum/views/favorites/favorites_view.dart';
import 'package:hey_istanbullum/views/googlemaps/google_maps_view.dart';
import 'package:hey_istanbullum/views/profile/my_profile_view.dart';

class MainController extends GetxController {
  var selectedIndex = 0.obs;
  FavoriteController favoriteController = Get.put(FavoriteController());
  List mainPages = [
    GoogleMapsView(),
    Favorities(),
    MyProfile(),
  ];
}
