import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/presentation/utils/theme.dart';

class RandomAyat extends StatelessWidget {
  final String ayat;

  const RandomAyat({Key? key, required this.ayat}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 10,
          ),
          Text(
            ayat,
            textAlign: TextAlign.right,
            style:
                GoogleFonts.amiri(fontSize: 24, color: blackColor, height: 2.3),
          ),
        ],
      ),
    );
  }
}
