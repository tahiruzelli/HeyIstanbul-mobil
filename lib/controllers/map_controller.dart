import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class MapController extends GetxController {
  var positionLoading = true.obs;
  bool isUserInIstanbul;
  Position position;
  Future determinePosition() async {
    positionLoading.value = true;
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      Get.snackbar('Error', 'Please enable Your Location Service');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        Get.snackbar('Error', 'Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      Get.snackbar('Error',
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    Position _position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    position = _position;
    userInIstanbul();
    positionLoading.value = false;
  }

  void userInIstanbul() {
    if (position.longitude > 41.619888 ||
        position.longitude < 40.796666 ||
        position.latitude > 27.941666 ||
        position.latitude < 29.973888) {
      Get.snackbar('Error', 'Istanbul sınırları dışındasınız!');
      isUserInIstanbul = false;
    } else {
      isUserInIstanbul = true;
    }
  }

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
}
