import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hey_istanbullum/services/fetch.dart';
import 'package:hey_istanbullum/views/location/location_list_page.dart';

class LoginController extends GetxController {
  TextEditingController nicknameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var loginLoading = false.obs;
  var isPasswordShow = true.obs;
  FetchData f = FetchData();
  login() async {
    loginLoading.value = true;
    var result =
        await f.login(nicknameController.text, passwordController.text);
    if (result["success"]) {
      GetStorage().write("jwtToken", result["data"]["jwtToken"]);
      GetStorage().write("id", result["data"]["id"]);
      Get.to(() => LocationListPage());
    } else {
      Get.snackbar("Hata", result["error"]);
    }
    loginLoading.value = false;
  }
}
