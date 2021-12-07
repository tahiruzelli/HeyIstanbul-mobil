import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:get/instance_manager.dart';
import 'package:hey_istanbullum/controllers/favorite_controller.dart';
import 'package:hey_istanbullum/views/favorites/widgets/favorite_card.dart';

class Favorities extends StatelessWidget {
  FavoriteController favoriteController = Get.find();

  @override
  Widget build(BuildContext context) {
    favoriteController.getMyFavorites();
    return Scaffold(
      body: Obx(
        () => favoriteController.myFavoritesLoading.value
            ? const Center(child: CupertinoActivityIndicator())
            : ListView.builder(
                itemCount: favoriteController.myFavorites.length,
                itemBuilder: (context, index) {
                  return FavoriteCard(favoriteController.myFavorites[index]);
                },
              ),
      ),
    );
  }
}
