import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:hey_istanbullum/services/rest_connector.dart';
import 'package:hey_istanbullum/services/urls.dart';

class FetchData {
  getJwtToken() {
    return GetStorage().read('jwtToken');
  }

  getUserId() {
    return GetStorage().read('userId');
  }

  login(String nickname, String password) async {
    Map body = {
      "nickname": nickname,
      "password": password,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      urlLogin,
      getJwtToken(),
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  register(String nickname, String password) async {
    Map body = {
      "nickname": nickname,
      "password": password,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      urlRegister,
      getJwtToken(),
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  Future getIsparkLocations() async {
    var response = await RestConnector(
      urlIspark,
      getJwtToken(),
      requestType: "GET",
      data: '',
    ).getData();
    return response['dataList'];
  }
}
