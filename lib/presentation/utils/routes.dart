import 'package:get/get.dart';
import 'package:muslim/presentation/pages/al-quran_page.dart';
import 'package:muslim/presentation/pages/asmaul_husna_page.dart';
import 'package:muslim/presentation/pages/ayat_kursi.dart';
import 'package:muslim/presentation/pages/doa_harian_page.dart';
import 'package:muslim/presentation/pages/tahlil_page.dart';
import 'package:muslim/presentation/pages/wirid_page.dart';
import 'package:muslim/presentation/widgets/pilih_hadits.dart';

List<Function> categoryRoutes = [
  () {
    Get.to(() => AlQuranPage());
  },
  () {
    Get.bottomSheet(PilihHadits());
  },
  () {
    Get.to(() => WiridPage());
  },
  () {
    Get.to(() => AsmaulHusnaPage());
  },
  () {
    Get.to(() => AyatKursiPage());
  },
  () {
    Get.to(() => WiridPage());
  },
  () {
    Get.to(() => DoaHarianPage());
  },
  () {
    Get.to(() => TahlilPage());
  },
];
