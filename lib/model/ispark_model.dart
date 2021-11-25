import 'package:hey_istanbullum/globals/utils/parse_json.dart';

class IsparkModel {
  int guid;
  String istasyonNo;
  String adi;
  int aktif;
  String bos;
  String dolu;
  String lat;
  String lon;
  String sonBaglanti;

  IsparkModel(
      {this.guid,
      this.istasyonNo,
      this.adi,
      this.aktif,
      this.bos,
      this.dolu,
      this.lat,
      this.lon,
      this.sonBaglanti});

  IsparkModel.fromJson(Map<String, dynamic> json) {
    guid = json['guid'];
    istasyonNo = json['istasyon_no'];
    adi = json['adi'];
    aktif = json['aktif'];
    bos = json['bos'];
    dolu = json['dolu'];
    lat = parseLatLongValue(json['lat']);
    lon = parseLatLongValue(json['lon']);
    sonBaglanti = json['sonBaglanti'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['guid'] = guid;
    data['istasyon_no'] = istasyonNo;
    data['adi'] = adi;
    data['aktif'] = aktif;
    data['bos'] = bos;
    data['dolu'] = dolu;
    data['lat'] = lat;
    data['lon'] = lon;
    data['sonBaglanti'] = sonBaglanti;
    return data;
  }
}
