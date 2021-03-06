import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/controllers/favorite_controller.dart';
import 'package:hey_istanbullum/controllers/profile_controller.dart';

AppBar myAppBar(String title,
    {bool isFavorite = false, bool isExit = false, bool didIFav = false}) {
  return AppBar(
    centerTitle: true,
    backgroundColor: Colors.black,
    title: Text(title),
    actions: [
      isFavorite
          ? IconButton(
              onPressed: () {
                FavoriteController favoriteController = Get.find();
                favoriteController.createFavorite();
              },
              icon: Icon(Icons.favorite, color: didIFav ? Colors.red : null),
            )
          : Container(),
      isExit
          ? IconButton(
              onPressed: () {
                ProfileController profileController =
                    Get.put(ProfileController());
                profileController.exitApp();
              },
              icon: const Icon(Icons.exit_to_app, color: Colors.red),
            )
          : Container(),
    ],
  );
}
