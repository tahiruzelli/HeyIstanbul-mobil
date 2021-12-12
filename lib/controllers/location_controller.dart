import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hey_istanbullum/controllers/map_controller.dart';
import 'package:hey_istanbullum/model/akaryakit_istasyonlari_model.dart';
import 'package:hey_istanbullum/model/comment_model.dart';
import 'package:hey_istanbullum/model/halk_ekmek_bufeleri_model.dart';
import 'package:hey_istanbullum/model/ibb_wifi_model.dart';
import 'package:hey_istanbullum/model/ispark_model.dart';
import 'package:hey_istanbullum/model/yol_calismalari_model.dart';
import 'package:hey_istanbullum/services/fetch.dart';
import 'package:hey_istanbullum/views/location/location_detail_view.dart';
import 'package:hey_istanbullum/views/mainPage/main_page.dart';

import 'main_controller.dart';

class LocationController extends GetxController {
  FetchData f = FetchData();
  List<IsparkModel> isparkList;
  List<YolCalismalariModel> yolCalismalariList;
  List<AkaryakitIstasyonlariModel> akaryakitIstasyonlariList;
  List<HalkEkmekBufeleriModel> halkEkmekBufeleriList;
  List<IBBWifiModel> ibbWifiList;
  Set<Marker> markers;
  Map choosenLocationDetail = {};
  List<CommentModel> commentList = [];
  var commentsLoading = false.obs;
  var listLoading = false.obs;
  double iconHeight = 75;
  double iconWidth = 75;
  TextEditingController commentTextFieldController = TextEditingController();
  MapController mapController = Get.find();

  BitmapDescriptor personIcon;
  void setUserMarker(context) async {
    final ImageConfiguration imageConfiguration =
        createLocalImageConfiguration(context);
    personIcon = await BitmapDescriptor.fromAssetImage(
        imageConfiguration, 'assets/icons/person.png');
    markers.add(
      Marker(
        markerId: MarkerId(mapController.position.latitude.toString()),
        position: LatLng(
          mapController.position.latitude,
          mapController.position.longitude,
        ),
        zIndex: 10,
        infoWindow: const InfoWindow(title: 'Konumum'),
        //icon: BitmapDescriptor.defaultMarkerWithHue(BitmapDescriptor.hueViolet),
        icon: personIcon,
      ),
    );
  }

  String get _locationId {
    return choosenLocationDetail['x'].toString() +
        '-' +
        choosenLocationDetail['y'].toString() +
        '-' +
        choosenLocationDetail['stringType'];
  }

  Future getIsparkLocations() async {
    listLoading.value = true;

    var response = await f.getIsparkLocations();
    isparkList =
        (response as List).map((e) => IsparkModel.fromJson(e)).toList();
    listLoading.value = false;
    markers = isparkList
        .map(
          (e) => Marker(
              onTap: () {
                choosenLocationDetail['title'] = e.adi;
                choosenLocationDetail['type'] = 0;
                choosenLocationDetail['stringType'] = 'ispark';
                choosenLocationDetail['x'] = e.lat;
                choosenLocationDetail['y'] = e.lon;
                choosenLocationDetail['title'] = e.adi;
                getComments();
                Get.to(LocationDetail());
              },
              markerId: MarkerId(
                e.guid.toString(),
              ),
              position: LatLng(
                double.parse(e.lat),
                double.parse(e.lon),
              ),
              zIndex: 10,
              infoWindow: InfoWindow(title: e.adi)),
        )
        .toSet();
//    mainController.selectedIndex.value = 0;
    Get.to(MainPage());
  }

  Future getAkaryakitIstasyonlari() async {
    listLoading.value = true;

    var response = await f.getAkaryakitIstasyonlari();
    akaryakitIstasyonlariList = (response as List)
        .map((e) => AkaryakitIstasyonlariModel.fromJson(e))
        .toList();
    listLoading.value = false;
    markers = akaryakitIstasyonlariList
        .map(
          (e) => Marker(
              onTap: () {
                choosenLocationDetail['title'] = e.fUELDISTRIBUTIONCOMPANYDESC;
                choosenLocationDetail['type'] = 1;
                choosenLocationDetail['stringType'] = 'akaryakit';
                choosenLocationDetail['x'] = e.lATITUDE;
                choosenLocationDetail['y'] = e.lONGTITUDE;
                choosenLocationDetail['title'] = e.fUELDISTRIBUTIONCOMPANYDESC;
                getComments();
                Get.to(LocationDetail());
              },
              markerId: MarkerId(e.iId.toString()),
              position: LatLng(
                e.lATITUDE,
                e.lONGTITUDE,
              ),
              zIndex: 10,
              infoWindow: InfoWindow(title: e.fUELDISTRIBUTIONCOMPANYDESC)),
        )
        .toSet();
    //  mainController.selectedIndex.value = 0;
    Get.to(MainPage());
  }

  Future getYolCalismalari() async {
    listLoading.value = true;

    var response = await f.getYolCalismalari();
    yolCalismalariList =
        (response as List).map((e) => YolCalismalariModel.fromJson(e)).toList();
    listLoading.value = false;
    markers = yolCalismalariList
        .map(
          (e) => Marker(
              onTap: () {
                choosenLocationDetail['title'] = e.properties.isinAdi;
                choosenLocationDetail['type'] = 2;
                choosenLocationDetail['stringType'] = 'yolCalismasi';
                choosenLocationDetail['x'] = e.properties.lat;
                choosenLocationDetail['y'] = e.properties.lon;
                choosenLocationDetail['title'] = e.properties.isinAdi;
                getComments();
                Get.to(LocationDetail());
              },
              markerId:
                  MarkerId((e.properties.lat + e.properties.lon).toString()),
              position: LatLng(
                e.properties.lat,
                e.properties.lon,
              ),
              zIndex: 10,
              infoWindow: InfoWindow(title: e.properties.isinAdi)),
        )
        .toSet();
    //  mainController.selectedIndex.value = 0;
    Get.to(MainPage());
  }

  Future getHalkEkmekBufeleri() async {
    listLoading.value = true;

    var response = await f.getHalkEkmekBufeleri();
    halkEkmekBufeleriList = (response as List)
        .map((e) => HalkEkmekBufeleriModel.fromJson(e))
        .toList();
    listLoading.value = false;
    markers = halkEkmekBufeleriList
        .map(
          (e) => Marker(
              onTap: () {
                choosenLocationDetail['title'] = e.bufeAdi;
                choosenLocationDetail['type'] = 3;
                choosenLocationDetail['stringType'] = 'halkEkmek';
                choosenLocationDetail['x'] = e.enlem;
                choosenLocationDetail['y'] = e.boylam;
                choosenLocationDetail['title'] = e.bufeAdi;
                getComments();
                Get.to(LocationDetail());
              },
              markerId: MarkerId((e.iId).toString()),
              position: LatLng(
                double.parse(e.enlem),
                double.parse(e.boylam),
              ),
              zIndex: 10,
              infoWindow: InfoWindow(title: e.bufeAdi)),
        )
        .toSet();
    //  mainController.selectedIndex.value = 0;
    Get.to(MainPage());
  }

  Future getIBBWifiLocations() async {
    listLoading.value = true;

    var response = await f.getIBBWifiLocations();
    ibbWifiList =
        (response as List).map((e) => IBBWifiModel.fromJson(e)).toList();
    listLoading.value = false;
    markers = ibbWifiList
        .map(
          (e) => Marker(
              onTap: () {
                choosenLocationDetail['title'] = e.lOCATIONCODE;
                choosenLocationDetail['type'] = 4;
                choosenLocationDetail['stringType'] = 'wifi';
                choosenLocationDetail['x'] = e.lATITUDE;
                choosenLocationDetail['y'] = e.lONGITUDE;
                choosenLocationDetail['title'] = e.lOCATIONCODE;
                getComments();
                Get.to(LocationDetail());
              },
              markerId: MarkerId((e.iId).toString()),
              position: LatLng(
                e.lATITUDE,
                e.lONGITUDE,
              ),
              zIndex: 10,
              infoWindow: InfoWindow(title: e.lOCATIONCODE)),
        )
        .toSet();
    //   mainController.selectedIndex.value = 0;
    Get.to(MainPage());
  }

  Future createComment() {
    f
        .createComment(_locationId, choosenLocationDetail['title'],
            commentTextFieldController.text)
        .then((value) {
      if (value['success']) {
        getComments();
      } else {
        Get.snackbar('Error', value['error']);
      }
    });
    commentTextFieldController.clear();
  }

  Future getComments() {
    commentsLoading.value = true;
    commentList.clear();
    f.getCommentByLocationId(_locationId).then((value) {
      commentList =
          (value as List).map((e) => CommentModel.fromJson(e)).toList();
      commentsLoading.value = false;
    });
  }

  Image get getLocationIcon {
    if (choosenLocationDetail['stringType'] == 'ispark') {
      return Image.asset(
        'assets/icons/isparkLogo.png',
        height: iconHeight,
        width: iconWidth,
      );
    } else if (choosenLocationDetail['stringType'] == 'akaryakit') {
      return Image.asset(
        'assets/icons/akaryakit.png',
        height: iconHeight,
        width: iconWidth,
      );
    } else if (choosenLocationDetail['stringType'] == 'yolCalismasi') {
      return Image.asset(
        'assets/icons/yolCalismasi.png',
        height: iconHeight,
        width: iconWidth,
      );
    } else if (choosenLocationDetail['stringType'] == 'halkEkmek') {
      return Image.asset(
        'assets/icons/halkEkmek.png',
        height: iconHeight,
        width: iconWidth,
      );
    } else if (choosenLocationDetail['stringType'] == 'wifi') {
      return Image.asset(
        'assets/icons/wifi.png',
        height: iconHeight,
        width: iconWidth,
      );
    }
  }
}
