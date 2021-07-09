import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/presentation/utils/theme.dart';

class RandomAyat extends StatelessWidget {
  final String ayat;
  final String surah;
  final String ayatKe;

  const RandomAyat({
    Key? key,
    required this.ayat,
    required this.surah,
    required this.ayatKe,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            children: [
              Text(
                ayat,
                textAlign: TextAlign.right,
                style: GoogleFonts.amiri(
                  fontSize: 25,
                  color: whiteColor,
                  height: 2.3,
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'QS. ${surah} ayat ${ayatKe}',
                textAlign: TextAlign.end,
                style: whiteTextBold.copyWith(
                  fontSize: 17,
                ),
              ),
              SizedBox(
                height: 10,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
