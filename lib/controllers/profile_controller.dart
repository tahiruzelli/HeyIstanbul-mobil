import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hey_istanbullum/controllers/location_controller.dart';
import 'package:hey_istanbullum/controllers/map_controller.dart';
import 'package:hey_istanbullum/model/comment_model.dart';
import 'package:hey_istanbullum/services/fetch.dart';
import 'package:hey_istanbullum/views/location/location_detail_view.dart';
import 'package:hey_istanbullum/views/login/login_view.dart';

class ProfileController extends GetxController {
  FetchData f = FetchData();
  List<CommentModel> myComments = [];
  var myCommentsLoading = false.obs;
  Set<Marker> marker = {};
  LocationController locationController = Get.find();
  MapController mapController = Get.find();
  Future getMyComments() {
    myCommentsLoading.value = true;
    f.getMyComments().then((value) {
      myComments =
          (value as List).map((e) => CommentModel.fromJson(e)).toList();
      myCommentsLoading.value = false;
    });
  }

  void exitApp() {
    GetStorage().remove('jwtToken');
    GetStorage().remove('id');
    GetStorage().remove('nickname');
    Get.offAll(LoginView());
  }

  void pushDetailPage(CommentModel favorite) {
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

  void setMarker(CommentModel commentModel) {
    marker.clear();
    marker.add(
      Marker(
        markerId: MarkerId(commentModel.locationId),
        position: LatLng(
          double.parse(commentModel.locationId.split('-').first),
          double.parse(
            commentModel.locationId.split('-')[1],
          ),
        ),
        zIndex: 10,
        infoWindow: InfoWindow(title: commentModel.title),
      ),
    );
  }

  Future<Widget> mapDialog(CommentModel favoriteCard) {
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
