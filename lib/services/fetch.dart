import 'dart:convert';
import 'package:get_storage/get_storage.dart';
import 'package:hey_istanbullum/globals/constans/urls.dart';
import 'package:hey_istanbullum/services/rest_connector.dart';

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
      requestType: "GETGLOBAL",
      data: '',
    ).getData();
    return response['dataList'];
  }

  Future getYolCalismalari() async {
    var response = await RestConnector(
      urlYolCalismalari,
      getJwtToken(),
      requestType: "GETGLOBAL",
      data: '',
    ).getData();
    return response['features'];
  }

  Future getAkaryakitIstasyonlari() async {
    var response = await RestConnector(
      urlAkaryakitIstasyonlari,
      getJwtToken(),
      requestType: "GETGLOBAL",
      data: '',
    ).getData();
    return response['value'];
  }

  Future getHalkEkmekBufeleri() async {
    var response = await RestConnector(
      urlHalkEkmekBufeleri,
      getJwtToken(),
      requestType: "GETGLOBAL",
      data: '',
    ).getData();
    return response['value'];
  }

  Future getIBBWifiLocations() async {
    var response = await RestConnector(
      urlIBBWifiLocations,
      getJwtToken(),
      requestType: "GETGLOBAL",
      data: '',
    ).getData();
    return response['value'];
  }

  Future createComment(String locationId, String title, String desc) async {
    Map body = {
      "locationId": locationId,
      "title": title,
      "description": desc,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      urlCreateComment,
      getJwtToken(),
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  Future getCommentByLocationId(String locationId) async {
    var response = await RestConnector(
      urlGetComments + '/$locationId',
      getJwtToken(),
      requestType: "GET",
      data: '',
    ).getData();
    return response['data'];
  }

  Future getMyComments() async {
    var response = await RestConnector(
      urlGetComments,
      getJwtToken(),
      requestType: "GET",
      data: '',
    ).getData();
    return response['data'];
  }

  Future createFavorite(String locationId) async {
    Map body = {
      "locationId": locationId,
    };
    var jsonBody = const JsonEncoder().convert(body);
    var response = await RestConnector(
      urlCreateFavorite,
      getJwtToken(),
      requestType: "POST",
      data: jsonBody,
    ).getData();
    return response;
  }

  Future deleteFavorite(String locationId) async {
    var response = await RestConnector(
      urlDeleteFavorite + locationId,
      getJwtToken(),
      requestType: "POST",
      data: '',
    ).getData();
    return response['data'];
  }

  Future getMyFavorites() async {
    var response = await RestConnector(
      urlGetFavorites,
      getJwtToken(),
      requestType: "GET",
      data: '',
    ).getData();
    return response['data'];
  }
}
