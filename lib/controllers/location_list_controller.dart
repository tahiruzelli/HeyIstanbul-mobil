import 'package:get/get.dart';
import 'package:hey_istanbullum/model/ispark_model.dart';
import 'package:hey_istanbullum/services/fetch.dart';
import 'package:hey_istanbullum/views/mainPage/main_page.dart';

class LocationListController extends GetxController {
  FetchData f = FetchData();
  List<IsparkModel> isparkList;
  var listLoading = false.obs;
  Future getIsparkLocations() async {
    listLoading.value = true;

    var response = await f.getIsparkLocations();
    isparkList =
        (response as List).map((e) => IsparkModel.fromJson(e)).toList();
    listLoading.value = false;
    Get.to(MainPage());
  }
}
