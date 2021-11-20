import 'package:get_storage/get_storage.dart';

class FetchData {
  getJwtToken() {
    return GetStorage().read('jwtToken');
  }

  getUserId() {
    return GetStorage().read('userId');
  }
}
