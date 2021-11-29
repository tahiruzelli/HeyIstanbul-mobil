class IBBWifiModel {
  int iId;
  String lOCATIONGROUP;
  String lOCATIONTYPE;
  String lOCATIONCODE;
  String lOCATION;
  double lONGITUDE;
  double lATITUDE;

  IBBWifiModel(
      {this.iId,
      this.lOCATIONGROUP,
      this.lOCATIONTYPE,
      this.lOCATIONCODE,
      this.lOCATION,
      this.lONGITUDE,
      this.lATITUDE});

  IBBWifiModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    lOCATIONGROUP = json['LOCATION_GROUP'];
    lOCATIONTYPE = json['LOCATION_TYPE'];
    lOCATIONCODE = json['LOCATION_CODE'];
    lOCATION = json['LOCATION'];
    lONGITUDE = json['LONGITUDE'];
    lATITUDE = json['LATITUDE'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = iId;
    data['LOCATION_GROUP'] = lOCATIONGROUP;
    data['LOCATION_TYPE'] = lOCATIONTYPE;
    data['LOCATION_CODE'] = lOCATIONCODE;
    data['LOCATION'] = lOCATION;
    data['LONGITUDE'] = lONGITUDE;
    data['LATITUDE'] = lATITUDE;
    return data;
  }
}
