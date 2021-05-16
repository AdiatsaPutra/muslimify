import 'package:flutter/material.dart';
import 'package:muslim/presentation/utils/theme.dart';

class Category extends StatelessWidget {
  final String text;
  final Function? onTap;

  const Category({Key? key, required this.text, required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.1),
                  blurRadius: 10,
                ),
              ],
            ),
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: buildAssetImage(text),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 5,
          ),
          Text(
            text,
            style: blackTextRegular.copyWith(fontSize: 12),
          )
        ],
      ),
    );
  }
}

AssetImage buildAssetImage(String category) {
  switch (category) {
    case 'Al-Quran':
      return AssetImage('assets/2.png');
    case 'Hadits':
      return AssetImage('assets/3.png');
    case 'Wirid':
      return AssetImage('assets/4.png');
    case 'Asmaul Husna':
      return AssetImage('assets/5.png');
    case 'Ayat Kursi':
      return AssetImage('assets/6.png');
    case 'Bacaan Sholat':
      return AssetImage('assets/7.png');
    case 'Doa Harian':
      return AssetImage('assets/9.png');
    case 'Tahlil':
      return AssetImage('assets/8.png');
    default:
      return AssetImage('');
  }
}
