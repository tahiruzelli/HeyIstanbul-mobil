class FavoriteModel {
  String locationId;
  Null user;
  String userId;
  String id;
  bool isActive;
  String created;

  FavoriteModel(
      {this.locationId,
      this.user,
      this.userId,
      this.id,
      this.isActive,
      this.created});

  FavoriteModel.fromJson(Map<String, dynamic> json) {
    locationId = json['locationId'];
    user = json['user'];
    userId = json['userId'];
    id = json['id'];
    isActive = json['isActive'];
    created = json['created'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['locationId'] = locationId;
    data['user'] = user;
    data['userId'] = userId;
    data['id'] = id;
    data['isActive'] = isActive;
    data['created'] = created;
    return data;
  }
}
