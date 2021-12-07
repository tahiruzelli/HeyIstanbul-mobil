import 'package:hey_istanbullum/globals/utils/parse_json.dart';

class UserModel {
  String id;
  String nickname;

  UserModel({this.id, this.nickname});

  UserModel.fromJson(Map<String, dynamic> json) {
    id = parseStringValue(json['id'].toString());
    nickname = parseStringValue(json['nickname'].toString());
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['id'] = this.id;
    data['nickname'] = this.nickname;
    return data;
  }
}
