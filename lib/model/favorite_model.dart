class FavoriteModel {
  String locationId;
  Null user;
  String userId;
  String id;
  bool isActive;
  String created;
  String title;

  FavoriteModel({
    this.locationId,
    this.user,
    this.userId,
    this.id,
    this.isActive,
    this.created,
    this.title,
  });

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    locationId = json['locationId'];
    user = json['user'];
    userId = json['userId'];
    id = json['id'];
    isActive = json['isActive'];
    created = json['created'];
    title = json['title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['locationId'] = locationId;
    data['user'] = user;
    data['userId'] = userId;
    data['id'] = id;
    data['isActive'] = isActive;
    data['created'] = created;
    data['title'] = title;
    return data;
  }
}
