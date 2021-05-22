import 'package:flutter/material.dart';
import 'package:muslim/presentation/utils/constant.dart';

class PilihPeriwayatHadits extends StatelessWidget {
  final String periwayat;

  const PilihPeriwayatHadits({Key? key, required this.periwayat})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        height: 100,
        width: 100,
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              blurRadius: 30,
              color: Colors.grey.withOpacity(0.2),
              offset: Offset(2, 2),
            ),
          ],
        ),
        child: Center(
          child: Text(
            periwayat,
            style: blackTextRegular.copyWith(color: primaryColor),
          ),
        ),
      ),
    );
  }
}
