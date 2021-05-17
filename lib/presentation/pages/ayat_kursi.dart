import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/cubit/ayat_kursi_cubit.dart';
import 'package:muslim/cubit/wirid_cubit.dart';
import 'package:muslim/models/ayat_kursi.dart';
import 'package:muslim/models/wirid.dart';
import 'package:muslim/presentation/pages/layout/detail_category_page.dart';
import 'package:muslim/presentation/utils/theme.dart';

class AyatKursiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DetailCategoryPage(
      pageTitle: 'AyatKursi',
      text: 'AyatKursi',
      onBack: () {
        Get.back();
      },
      child: BlocConsumer<AyatKursiCubit, AyatKursiState>(
        listener: (context, state) {
          if (state is AyatKursiError) {
            return Get.snackbar('Error', state.message.toString());
          }
        },
        builder: (context, state) {
          if (state is AyatKursiLoaded) {
            AyatKursi ayatKursi = state.ayatKursi;
            return Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: margin, vertical: 50),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    ayatKursi.arabic,
                    style: GoogleFonts.amiri(fontSize: 28, height: 2.7),
                    textAlign: TextAlign.right,
                  ),
                  Text(
                    ayatKursi.latin,
                    style: GoogleFonts.amiri(fontSize: 20),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: margin),
                    child: Text(
                      'Artinya:',
                      style: blackTextBold,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Text(
                    ayatKursi.translation,
                    style: blackTextRegular,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: margin),
                    child: Text(
                      'Tafsir Ayat Kursi:',
                      style: blackTextBold,
                      textAlign: TextAlign.justify,
                    ),
                  ),
                  Text(
                    ayatKursi.tafsir,
                    style: blackTextRegular,
                  ),
                ],
              ),
            );
          } else {
            return Center(
              child: SpinKitFadingCircle(
                color: primaryColor,
              ),
            );
          }
        },
      ),
    );
  }
}
