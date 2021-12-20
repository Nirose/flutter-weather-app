// To parse this JSON data, do
//
//     final geoModel = geoModelFromJson(jsonString);
// LocalNames is returned empty because the API doesn't return local_names for some cities
// And we're not using local_names in the app anyway. Fixes are welcome.

import 'dart:convert';

List<GeoModel> geoModelFromJson(String str) =>
    List<GeoModel>.from(json.decode(str).map((x) => GeoModel.fromJson(x)));

String geoModelToJson(List<GeoModel> data) =>
    json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class GeoModel {
  GeoModel({
    required this.name,
    this.localNames,
    required this.lat,
    required this.lon,
    required this.country,
  });

  String name;
  LocalNames? localNames;
  double lat;
  double lon;
  String country;

  factory GeoModel.fromJson(Map<String, dynamic> json) => GeoModel(
        name: json["name"],
        lat: json["lat"].toDouble(),
        lon: json["lon"].toDouble(),
        country: json["country"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "local_names": localNames?.toJson(),
        "lat": lat,
        "lon": lon,
        "country": country,
      };
}

class LocalNames {
  LocalNames({
    required this.af,
    required this.ar,
    required this.ascii,
    required this.az,
    required this.bg,
    required this.ca,
    required this.da,
    required this.de,
    required this.el,
    required this.en,
    required this.eu,
    required this.fa,
    required this.featureName,
    required this.fi,
    required this.fr,
    required this.gl,
    required this.he,
    required this.hi,
    required this.hr,
    required this.hu,
    required this.id,
    required this.it,
    required this.ja,
    required this.la,
    required this.lt,
    required this.mk,
    required this.nl,
    required this.no,
    required this.pl,
    required this.pt,
    required this.ro,
    required this.ru,
    required this.sk,
    required this.sl,
    required this.sr,
    required this.th,
    required this.tr,
    required this.vi,
    required this.zu,
  });

  String? af;
  String? ar;
  String? ascii;
  String? az;
  String? bg;
  String? ca;
  String? da;
  String? de;
  String? el;
  String? en;
  String? eu;
  String? fa;
  String? featureName;
  String? fi;
  String? fr;
  String? gl;
  String? he;
  String? hi;
  String? hr;
  String? hu;
  String? id;
  String? it;
  String? ja;
  String? la;
  String? lt;
  String? mk;
  String? nl;
  String? no;
  String? pl;
  String? pt;
  String? ro;
  String? ru;
  String? sk;
  String? sl;
  String? sr;
  String? th;
  String? tr;
  String? vi;
  String? zu;

  factory LocalNames.fromJson(Map<String, dynamic> json) => LocalNames(
        af: json["af"],
        ar: json["ar"],
        ascii: json["ascii"],
        az: json["az"],
        bg: json["bg"],
        ca: json["ca"],
        da: json["da"],
        de: json["de"],
        el: json["el"],
        en: json["en"],
        eu: json["eu"],
        fa: json["fa"],
        featureName: json["feature_name"],
        fi: json["fi"],
        fr: json["fr"],
        gl: json["gl"],
        he: json["he"],
        hi: json["hi"],
        hr: json["hr"],
        hu: json["hu"],
        id: json["id"],
        it: json["it"],
        ja: json["ja"],
        la: json["la"],
        lt: json["lt"],
        mk: json["mk"],
        nl: json["nl"],
        no: json["no"],
        pl: json["pl"],
        pt: json["pt"],
        ro: json["ro"],
        ru: json["ru"],
        sk: json["sk"],
        sl: json["sl"],
        sr: json["sr"],
        th: json["th"],
        tr: json["tr"],
        vi: json["vi"],
        zu: json["zu"],
      );

  Map<String, dynamic> toJson() => {
        "af": af,
        "ar": ar,
        "ascii": ascii,
        "az": az,
        "bg": bg,
        "ca": ca,
        "da": da,
        "de": de,
        "el": el,
        "en": en,
        "eu": eu,
        "fa": fa,
        "feature_name": featureName,
        "fi": fi,
        "fr": fr,
        "gl": gl,
        "he": he,
        "hi": hi,
        "hr": hr,
        "hu": hu,
        "id": id,
        "it": it,
        "ja": ja,
        "la": la,
        "lt": lt,
        "mk": mk,
        "nl": nl,
        "no": no,
        "pl": pl,
        "pt": pt,
        "ro": ro,
        "ru": ru,
        "sk": sk,
        "sl": sl,
        "sr": sr,
        "th": th,
        "tr": tr,
        "vi": vi,
        "zu": zu,
      };

  factory LocalNames.empty(Map<String, dynamic> json) => LocalNames(
        af: '',
        ar: '',
        ascii: '',
        az: '',
        bg: '',
        ca: '',
        da: '',
        de: '',
        el: '',
        en: '',
        eu: '',
        fa: '',
        featureName: '',
        fi: '',
        fr: '',
        gl: '',
        he: '',
        hi: '',
        hr: '',
        hu: '',
        id: '',
        it: '',
        ja: '',
        la: '',
        lt: '',
        mk: '',
        nl: '',
        no: '',
        pl: '',
        pt: '',
        ro: '',
        ru: '',
        sk: '',
        sl: '',
        sr: '',
        th: '',
        tr: '',
        vi: '',
        zu: '',
      );

  Map<String, dynamic> empty() => {
        'af': '',
        'ar': '',
        'ascii': '',
        'az': '',
        'bg': '',
        'ca': '',
        'da': '',
        'de': '',
        'el': '',
        'en': '',
        'eu': '',
        'fa': '',
        'featureName': '',
        'fi': '',
        'fr': '',
        'gl': '',
        'he': '',
        'hi': '',
        'hr': '',
        'hu': '',
        'id': '',
        'it': '',
        'ja': '',
        'la': '',
        'lt': '',
        'mk': '',
        'nl': '',
        'no': '',
        'pl': '',
        'pt': '',
        'ro': '',
        'ru': '',
        'sk': '',
        'sl': '',
        'sr': '',
        'th': '',
        'tr': '',
        'vi': '',
        'zu': '',
      };
}
