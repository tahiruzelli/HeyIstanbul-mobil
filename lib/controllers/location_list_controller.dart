import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:hey_istanbullum/model/akaryakit_istasyonlari_model.dart';
import 'package:hey_istanbullum/model/halk_ekmek_bufeleri_model.dart';
import 'package:hey_istanbullum/model/ibb_wifi_model.dart';
import 'package:hey_istanbullum/model/ispark_model.dart';
import 'package:hey_istanbullum/model/yol_calismalari_model.dart';
import 'package:hey_istanbullum/services/fetch.dart';
import 'package:hey_istanbullum/views/mainPage/main_page.dart';

class LocationListController extends GetxController {
  FetchData f = FetchData();
  List<IsparkModel> isparkList;
  List<YolCalismalariModel> yolCalismalariList;
  List<AkaryakitIstasyonlariModel> akaryakitIstasyonlariList;
  List<HalkEkmekBufeleriModel> halkEkmekBufeleriList;
  List<IBBWifiModel> ibbWifiList;
  Set<Marker> markers;
  var listLoading = false.obs;
  Future getIsparkLocations() async {
    listLoading.value = true;

    var response = await f.getIsparkLocations();
    isparkList =
        (response as List).map((e) => IsparkModel.fromJson(e)).toList();
    listLoading.value = false;
    markers = isparkList
        .map(
          (e) => Marker(
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
              markerId: MarkerId(e.iId.toString()),
              position: LatLng(
                e.lATITUDE,
                e.lONGTITUDE,
              ),
              zIndex: 10,
              infoWindow: InfoWindow(title: e.fUELDISTRIBUTIONCOMPANYDESC)),
        )
        .toSet();
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
              markerId: MarkerId((e.iId).toString()),
              position: LatLng(
                double.parse(e.enlem),
                double.parse(e.boylam),
              ),
              zIndex: 10,
              infoWindow: InfoWindow(title: e.bufeAdi)),
        )
        .toSet();
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
              markerId: MarkerId((e.iId).toString()),
              position: LatLng(
                e.lATITUDE,
                e.lONGITUDE,
              ),
              zIndex: 10,
              infoWindow: InfoWindow(title: e.lOCATIONCODE)),
        )
        .toSet();
    Get.to(MainPage());
  }
}
