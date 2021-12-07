String parseStringValue(dynamic value) {
  String defaultVal = "";
  try {
    defaultVal = value.toString();
  } catch (ex) {
    print(ex);
  }

  return defaultVal;
}

String parseLatLongValue(String value) {
  String defaultValue = '0';
  if (value == '') {
    return defaultValue;
  } else if (value.toString() == 'null') {
    return defaultValue;
  } else if (value == null) {
    return defaultValue;
  } else {
    return value;
  }
}

int parseIntValue(String fromModel, String fieldname, dynamic value) {
  int defaultVal = 0;
  try {
    defaultVal = value.floor();
  } catch (ex) {
    print("*** PARSE JSON HATA (" +
        fromModel +
        " class  - field:" +
        fieldname.toString() +
        "" +
        ") exception:" +
        ex.toString());
  }

  return defaultVal;
}

double parseDoubleValue(dynamic value) {
  double defaultVal = 0.0;
  try {
    defaultVal = value;
    return defaultVal;
  } catch (e) {
    return defaultVal;
  }
}

List<Map<String, dynamic>> parseListValue(
    String fromModel, String fieldname, dynamic value) {
  List<Map<String, dynamic>> defaultVal = List<Map<String, dynamic>>();
  try {
    //defaultVal = value;
    defaultVal = List<Map<String, dynamic>>.from(value);
  } catch (ex) {
    print("*** PARSE JSON HATA (" +
        fromModel +
        " class  - field:" +
        fieldname.toString() +
        "" +
        ") exception:" +
        ex.toString());
  }

  return defaultVal;
}

Map<String, dynamic> parseMapValue(
    String fromModel, String fieldname, dynamic value) {
  Map<String, dynamic> defaultVal = Map<String, dynamic>();
  try {
    //defaultVal = value;
    defaultVal = Map<String, dynamic>.from(value);
  } catch (ex) {
    print("*** PARSE JSON HATA (" +
        fromModel +
        " class  - field:" +
        fieldname.toString() +
        "" +
        ") exception:" +
        ex.toString());
  }

  return defaultVal;
}
