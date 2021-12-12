import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hey_istanbullum/controllers/location_controller.dart';
import 'package:hey_istanbullum/model/favorite_model.dart';
import 'package:hey_istanbullum/services/fetch.dart';
import 'package:hey_istanbullum/views/location/location_detail_view.dart';

import 'map_controller.dart';

class FavoriteController extends GetxController {
  FetchData f = FetchData();
  LocationController locationController = Get.find();
  MapController mapController = Get.find();
  var myFavoritesLoading = false.obs;
  List<FavoriteModel> myFavorites = [];
  RxBool didIFav = false.obs;
  RxBool didIFavLoading = false.obs;
  double iconHeight = 50;
  double iconWidth = 50;
  Set<Marker> marker = {};
  String get _locationId {
    return locationController.choosenLocationDetail['x'].toString() +
        '-' +
        locationController.choosenLocationDetail['y'].toString() +
        '-' +
        locationController.choosenLocationDetail['stringType'];
  }

  Future<bool> isAlreadyFavorite() async {
    didIFav.value = false;
    didIFavLoading.value = true;
    var response = await f.isFavorite(_locationId);
    didIFav.value = response['isAlreadyFavorite'];
    didIFavLoading.value = false;
    return response['isAlreadyFavorite'];
  }

  createFavorite() async {
    if (didIFav.value) {
      Get.snackbar('Uyarı', 'Bu konum zaten favorilerinizde');
    } else {
      f
          .createFavorite(
              _locationId, locationController.choosenLocationDetail['title'])
          .then((value) {
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
    String stringType = favorite.locationId.split('-').last;
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
    locationController.choosenLocationDetail['title'] = favorite.title;
    locationController.getComments();
    Get.to(LocationDetail());
  }

  void setMarker(FavoriteModel favoriteCard) {
    marker.clear();
    marker.add(
      Marker(
        markerId: MarkerId(favoriteCard.locationId),
        position: LatLng(
          double.parse(favoriteCard.locationId.split('-').first),
          double.parse(
            favoriteCard.locationId.split('-')[1],
          ),
        ),
        zIndex: 10,
        infoWindow: InfoWindow(title: favoriteCard.title),
      ),
    );
  }

  Future<Widget> mapDialog(FavoriteModel favoriteCard) {
    setMarker(favoriteCard);
    return Get.dialog(
      Padding(
        padding: EdgeInsets.symmetric(
            horizontal: Get.height * 0.05, vertical: Get.height * 0.18),
        child: Container(
          height: Get.height * 0.6,
          width: Get.width * 0.8,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Expanded(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: SizedBox(
                    child: GoogleMap(
                      myLocationButtonEnabled: false,
                      zoomControlsEnabled: false,
                      mapType: MapType.normal,
                      onMapCreated: (map) {},
                      markers: marker,
                      initialCameraPosition: CameraPosition(
                        target: LatLng(
                          double.parse(
                              favoriteCard.locationId.split('-').first),
                          double.parse(
                            favoriteCard.locationId.split('-')[1],
                          ),
                        ),
                        zoom: 10,
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12.0),
                child: RaisedButton(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  color: Colors.green,
                  onPressed: () {
                    Get.back();
                    pushDetailPage(favoriteCard);
                  },
                  child: SizedBox(
                    width: Get.width,
                    child: const Center(
                      child: Text(
                        'Yorumları Gör',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
