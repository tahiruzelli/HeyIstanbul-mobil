import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/services/fetch.dart';
import 'package:hey_istanbullum/views/login/login_view.dart';

class RegisterController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();

  var registerLoading = false.obs;
  var isPasswordShow = true.obs;
  FetchData f = FetchData();
  register() async {
    registerLoading.value = true;
    var result = await f.register(
        nicknameController.text, passwordController.text);
    if (result["success"]) {
      Get.snackbar("Başarılı", "Giriş yapınız.");
      sleep(const Duration(seconds: 2));
      Get.to(() => LoginView());
    } else {
      Get.snackbar("Hata", result["error"]);
    }
    registerLoading.value = false;
  }
}
