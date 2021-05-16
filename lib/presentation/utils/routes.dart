import 'package:get/get.dart';
import 'package:muslim/presentation/pages/asmaul_husna_page.dart';
import 'package:muslim/presentation/pages/ayat_kursi.dart';
import 'package:muslim/presentation/pages/wirid_page.dart';

List<Function> categoryRoutes = [
  () {
    Get.to(() => WiridPage());
  },
  () {
    Get.to(() => WiridPage());
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
    Get.to(() => WiridPage());
  },
  () {
    Get.to(() => WiridPage());
  },
];
