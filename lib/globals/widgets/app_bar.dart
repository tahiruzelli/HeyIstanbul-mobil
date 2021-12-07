import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/controllers/favorite_controller.dart';

AppBar myAppBar(String title, {bool isFavorite = false}) {
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
              icon: const Icon(Icons.favorite_border),
            )
          : Container(),
    ],
  );
}
