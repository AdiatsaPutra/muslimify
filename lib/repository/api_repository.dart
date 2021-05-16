import 'dart:convert';
import 'dart:math';
import 'package:muslim/models/al-quran.dart';
import 'package:muslim/models/ayat_hari_ini.dart';
import 'package:muslim/models/ayat_kursi.dart';
import 'package:muslim/models/doa_harian.dart';
import 'package:muslim/models/image.dart';
import 'package:muslim/models/kisah_nabi.dart';
import 'package:http/http.dart' as http;
import 'package:muslim/models/niat_sholat.dart';
import 'package:muslim/models/quote.dart';
import 'package:muslim/models/tahlil.dart';
import 'package:muslim/models/asmaul_husna.dart';
import 'package:muslim/models/wirid.dart';

class ApiRepository {
  static Future<AlQuran> getAlQuran() async {
    String url =
        'https://islamic-api-indonesia.herokuapp.com/api/data/json/quran';
    try {
      var response = await http.get(Uri.parse(url));
      var json = jsonDecode(response.body);
      var result = json['result']['data'];
      print(result);
      return AlQuran.fromJson(result);
    } catch (e) {
      throw Exception(e);
    }
  }

  int rand = Random().nextInt(6235) + 1;
  Future<AyatHariIni> getAyatHariIni() async {
    String url = 'https://api.alquran.cloud/ayah/';
    try {
      var response = await http.get(Uri.parse(url + rand.toString()));
      var json = jsonDecode(response.body);
      var result = json['data'];
      return AyatHariIni.fromJson(result);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<Quote> getQuote() async {
    String url = 'https://islamic-api-indonesia.herokuapp.com/api/data/quotes';
    try {
      var response = await http.get(Uri.parse(url));
      var json = jsonDecode(response.body);
      var result = json['result'];
      return Quote.fromJson(result);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<BackgroundImage> getImage() async {
    String url = 'https://islamic-api-indonesia.herokuapp.com/api/data/gambar';
    try {
      var response = await http.get(Uri.parse(url));
      var json = jsonDecode(response.body);
      var result = json['result'];
      return BackgroundImage.fromJson(result);
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<KisahNabi>> getKisahNabi() async {
    String url =
        'https://islamic-api-indonesia.herokuapp.com/api/data/json/kisahnabi';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        List result = json['result'];
        return result.map((e) => KisahNabi.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<DoaHarian>> getDoaHarian() async {
    String url =
        'https://islamic-api-indonesia.herokuapp.com/api/data/json/doaharian';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        List result = json['result']['data'];
        return result.map((e) => DoaHarian.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Tahlil>> getTahlil() async {
    String url =
        'https://islamic-api-indonesia.herokuapp.com/api/data/json/tahlil';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        List result = json['result']['data'];
        return result.map((e) => Tahlil.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<Wirid>> getWirid() async {
    String url =
        'https://islamic-api-indonesia.herokuapp.com/api/data/json/wirid';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        List result = json['result']['data'];
        return result.map((e) => Wirid.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<AsmaulHusna>> getAsmaulHusna() async {
    String url =
        'https://islamic-api-indonesia.herokuapp.com/api/data/json/asmaulhusna';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        List result = json['result']['data'];
        print(result);
        return result.map((e) => AsmaulHusna.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<NiatSholat>> getNiatSholat() async {
    String url =
        'https://islamic-api-indonesia.herokuapp.com/api/data/json/niatshalat';
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var json = jsonDecode(response.body);
        List result = json['result'];
        return result.map((e) => NiatSholat.fromJson(e)).toList();
      } else {
        return [];
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<AyatKursi> getAyatKursi() async {
    String url =
        'https://islamic-api-indonesia.herokuapp.com/api/data/json/ayatkursi';
    try {
      var response = await http.get(Uri.parse(url));
      var json = jsonDecode(response.body);
      var result = json['result']['data'];
      return AyatKursi.fromJson(result);
    } catch (e) {
      throw Exception(e);
    }
  }
}
