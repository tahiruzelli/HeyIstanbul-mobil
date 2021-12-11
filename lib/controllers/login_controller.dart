import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:hey_istanbullum/services/fetch.dart';
import 'package:hey_istanbullum/views/location/location_list_page.dart';
import 'package:crypto/crypto.dart' as cyrpto;

class LoginController extends GetxController {
  TextEditingController nicknameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var loginLoading = false.obs;
  var isPasswordShow = true.obs;
  FetchData f = FetchData();
  login() async {
    loginLoading.value = true;
    var bytes = utf8.encode(passwordController.text);
    var key = cyrpto.md5.convert(bytes);
    var result = await f.login(nicknameController.text, key.toString());
    if (result["success"]) {
      GetStorage().write("jwtToken", result["data"]["jwtToken"]);
      GetStorage().write("id", result["data"]["id"]);
      GetStorage().write('nickname', nicknameController.text);
      Get.to(() => LocationListPage());
    } else {
      Get.snackbar("Hata", result["error"]);
    }
    loginLoading.value = false;
  }
}
