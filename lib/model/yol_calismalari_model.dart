class YolCalismalariModel {
  String type;
  Properties properties;

  YolCalismalariModel({this.type, this.properties});

  YolCalismalariModel.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    properties = json['properties'] != null
        ? Properties.fromJson(json['properties'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['type'] = type;
    if (properties != null) {
      data['properties'] = properties.toJson();
    }
    return data;
  }
}

class Properties {
  String isinCinsi;
  String ilce;
  String isinAdi;
  String tarih;
  String gece;
  String yaka;
  String harita;
  double lat;
  double lon;

  Properties(
      {this.isinCinsi,
      this.ilce,
      this.isinAdi,
      this.tarih,
      this.gece,
      this.yaka,
      this.harita,
      this.lat,
      this.lon});

  Properties.fromJson(Map<String, dynamic> json) {
    isinCinsi = json['isin_cinsi'];
    ilce = json['ilce'];
    isinAdi = json['isin_adi'];
    tarih = json['tarih'];
    gece = json['gece'];
    yaka = json['yaka'];
    harita = json['harita'];
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['isin_cinsi'] = isinCinsi;
    data['ilce'] = ilce;
    data['isin_adi'] = isinAdi;
    data['tarih'] = tarih;
    data['gece'] = gece;
    data['yaka'] = yaka;
    data['harita'] = harita;
    data['lat'] = lat;
    data['lon'] = lon;
    return data;
  }
}
