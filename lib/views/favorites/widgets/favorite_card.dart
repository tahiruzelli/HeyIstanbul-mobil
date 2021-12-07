import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/controllers/favorite_controller.dart';
import 'package:hey_istanbullum/model/favorite_model.dart';
import 'package:hey_istanbullum/views/location/location_detail_view.dart';

class FavoriteCard extends StatelessWidget {
  FavoriteModel favoriteCard;
  FavoriteCard(this.favoriteCard);
  FavoriteController favoriteController = Get.find();
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {
        favoriteController.pushDetailPage(favoriteCard);
      },
      onLongPress: () {
        _onLongPressed(context);
      },
      leading: favoriteController.getLeadingIcon(favoriteCard),
      title: Text(favoriteCard.locationId.split('-').last),
      //subtitle: const Text('Kadıköy rıhtım ispark'),
      trailing: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            favoriteCard.locationId.split('-').first,
            style: const TextStyle(fontSize: 12),
          ),
          Text(
            favoriteCard.locationId.split('-')[1],
            style: const TextStyle(fontSize: 12),
          ),
        ],
      ),
    );
  }

  _onLongPressed(context) {
    return showCupertinoModalPopup(
      context: context,
      barrierDismissible: false,
      builder: (context) {
        return CupertinoActionSheet(
          cancelButton: CupertinoActionSheetAction(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: const Text(
              "Iptal",
              style: TextStyle(color: Colors.blue),
            ),
          ),
          actions: [
            CupertinoActionSheetAction(
              onPressed: () {},
              child: const Text("Favorilerimden Kaldır",
                  textAlign: TextAlign.left,
                  style: TextStyle(color: Colors.red)),
            ),
          ],
        );
      },
    );
  }
}
