import 'package:flutter/material.dart';
import 'package:muslim/models/models.dart';
import 'package:muslim/presentation/presentation.dart';
import 'package:muslim/presentation/utils/theme.dart';

class AyatHariIniBox extends StatelessWidget {
  const AyatHariIniBox({
    Key? key,
    required this.backgroundImage,
    required this.ayatHariIni,
  }) : super(key: key);

  final BackgroundImage backgroundImage;
  final AyatHariIni ayatHariIni;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: NetworkImage(
                backgroundImage.image,
              ),
              fit: BoxFit.cover,
            ),
            boxShadow: shadow,
          ),
        ),
        Container(
          height: 150,
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        RandomAyat(
                          ayat: ayatHariIni.ayat,
                          surah: ayatHariIni.surah,
                          ayatKe: ayatHariIni.ayatKe.toString(),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
