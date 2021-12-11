import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/controllers/location_controller.dart';
import 'package:hey_istanbullum/model/favorite_model.dart';
import 'package:hey_istanbullum/services/fetch.dart';
import 'package:hey_istanbullum/views/location/location_detail_view.dart';

class FavoriteController extends GetxController {
  FetchData f = FetchData();
  LocationController locationController = Get.find();
  var myFavoritesLoading = false.obs;
  List<FavoriteModel> myFavorites = [];
  RxBool didIFav = false.obs;
  double iconHeight = 50;
  double iconWidth = 50;
  String get _locationId {
    return locationController.choosenLocationDetail['x'].toString() +
        '-' +
        locationController.choosenLocationDetail['y'].toString() +
        '-' +
        locationController.choosenLocationDetail['stringType'];
  }

  Future<bool> isAlreadyFavorite() async {
    didIFav.value = false;
    var response = await f.isFavorite(_locationId);
    didIFav.value = response['isAlreadyFavorite'];
    return response['isAlreadyFavorite'];
  }

  createFavorite() async {
    bool isFavorite = await isAlreadyFavorite();
    if (isFavorite) {
      Get.snackbar('Uyarı', 'Bu konum zaten favorilerinizde');
    } else {
      f.createFavorite(_locationId).then((value) {
        if (value['success']) {
          Get.snackbar('Başarı', 'Favorilerinize eklendi');
          didIFav.value = true;
        } else {
          Get.snackbar('Hata', value['error']);
        }
      });
    }
  }

  Future getMyFavorites() {
    myFavoritesLoading.value = true;
    f.getMyFavorites().then((value) {
      myFavorites =
          (value as List).map((e) => FavoriteModel.fromJson(e)).toList();
      myFavoritesLoading.value = false;
    });
  }

  Image getLeadingIcon(FavoriteModel favorite) {
    String stringType = favorite.locationId.split('+').last;
    if (stringType == 'ispark') {
      return Image.asset('assets/icons/isparkLogo.png',
          height: iconHeight, width: iconWidth);
    } else if (stringType == 'akaryakit') {
      return Image.asset('assets/icons/akaryakit.png',
          height: iconHeight, width: iconWidth);
    } else if (stringType == 'yolCalismasi') {
      return Image.asset('assets/icons/yolCalismasi.png',
          height: iconHeight, width: iconWidth);
    } else if (stringType == 'halkEkmek') {
      return Image.asset('assets/icons/halkEkmek.png',
          height: iconHeight, width: iconWidth);
    } else if (stringType == 'wifi') {
      return Image.asset('assets/icons/wifi.png',
          height: iconHeight, width: iconWidth);
    }
  }

  void pushDetailPage(FavoriteModel favorite) {
    locationController.choosenLocationDetail['title'] =
        favorite.locationId.split('-').last;

    locationController.choosenLocationDetail['stringType'] =
        favorite.locationId.split('-').last;
    locationController.choosenLocationDetail['x'] =
        favorite.locationId.split('-').first;
    locationController.choosenLocationDetail['y'] =
        favorite.locationId.split('-')[1];
    locationController.getComments();

    Get.to(LocationDetail());
  }
}
