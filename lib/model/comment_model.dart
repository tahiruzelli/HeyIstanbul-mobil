import 'package:hey_istanbullum/model/user_model.dart';

class CommentModel {
  String locationId;
  String title;
  String description;
  UserModel user;
  String userId;
  String id;
  bool isActive;
  String created;

  CommentModel(
      {this.locationId,
      this.title,
      this.description,
      this.user,
      this.userId,
      this.id,
      this.isActive,
      this.created});

  CommentModel.fromJson(Map<String, dynamic> json) {
    locationId = json['locationId'];
    title = json['title'];
    description = json['description'];
    user = json['user'].toString() == 'null'
        ? null
        : UserModel.fromJson(json['user']);
    userId = json['userId'];
    id = json['id'];
    isActive = json['isActive'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['locationId'] = locationId;
    data['title'] = title;
    data['description'] = description;
    data['user'] = user;
    data['userId'] = userId;
    data['id'] = id;
    data['isActive'] = isActive;
    data['created'] = created;
    return data;
  }
}
