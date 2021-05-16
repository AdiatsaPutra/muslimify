import 'package:muslim/datasource/api_datasource.dart';
import 'package:muslim/models/doa_harian.dart';
import 'package:muslim/models/image.dart';
import 'package:muslim/models/kisah_nabi.dart';
import 'package:muslim/models/niat_sholat.dart';
import 'package:muslim/models/quote.dart';
import 'package:muslim/models/ayat_hari_ini.dart';
import 'package:muslim/models/tahlil.dart';
import 'package:muslim/models/wirid.dart';

class APIRepository {
  APIDataSource muslimDataSource = APIDataSource();

  Future<AyatHariIni> getAyatHariIni() async {
    return muslimDataSource.getAyatHariIni();
  }

  Future<Quote> getQuote() async {
    return muslimDataSource.getQuote();
  }

  Future<BackgroundImage> getImage() async {
    return muslimDataSource.getImage();
  }

  Future<List<KisahNabi>> getKisahNabi() async {
    return muslimDataSource.getKisahNabi();
  }

  Future<List<DoaHarian>> getDoaHarian() async {
    return muslimDataSource.getDoaHarian();
  }

  Future<List<Tahlil>> getTahlil() async {
    return muslimDataSource.getTahlil();
  }

  Future<List<Wirid>> getWirid() async {
    return muslimDataSource.getWirid();
  }

  Future<List<NiatSholat>> getNiatSholat() async {
    return muslimDataSource.getNiatSholat();
  }
}
