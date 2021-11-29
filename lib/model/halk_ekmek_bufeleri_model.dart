class HalkEkmekBufeleriModel {
  int iId;
  String ilceAdi;
  String mahalleAdi;
  String bufeAdi;
  String enlem;
  String boylam;

  HalkEkmekBufeleriModel(
      {this.iId,
      this.ilceAdi,
      this.mahalleAdi,
      this.bufeAdi,
      this.enlem,
      this.boylam});

  HalkEkmekBufeleriModel.fromJson(Map<String, dynamic> json) {
    iId = json['_id'];
    ilceAdi = json['Ilce_Adi'];
    mahalleAdi = json['Mahalle_Adi'];
    bufeAdi = json['Bufe_Adi'];
    enlem = json['Enlem'];
    boylam = json['Boylam'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['_id'] = iId;
    data['Ilce_Adi'] = ilceAdi;
    data['Mahalle_Adi'] = mahalleAdi;
    data['Bufe_Adi'] = bufeAdi;
    data['Enlem'] = enlem;
    data['Boylam'] = boylam;
    return data;
  }
}
