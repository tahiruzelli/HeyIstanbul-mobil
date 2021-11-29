import 'package:hey_istanbullum/globals/utils/parse_json.dart';

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
    lONGITUDE = parseDoubleValue(json['LONGITUDE']);
    lATITUDE = parseDoubleValue(json['LATITUDE']);
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
