import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:hey_istanbullum/services/fetch.dart';
import 'package:hey_istanbullum/views/login/login_view.dart';
import 'package:crypto/crypto.dart' as cyrpto;

class RegisterController extends GetxController {
  TextEditingController passwordController = TextEditingController();
  TextEditingController nicknameController = TextEditingController();

  var registerLoading = false.obs;
  var isPasswordShow = true.obs;
  FetchData f = FetchData();
  register() async {
    registerLoading.value = true;
    var bytes = utf8.encode(passwordController.text);
    var key = cyrpto.md5.convert(bytes);
    var result = await f.register(nicknameController.text, key.toString());
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
