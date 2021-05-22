import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim/presentation/utils/constant.dart';
import 'package:muslim/presentation/widgets/pilih_periwayat_hadits.dart';

class PilihHadits extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    List<String> periwayatHadits = [
      'Abu Daud',
      'Abu Daud',
      'Bukhari',
      'Darimi',
      'Ibnu Majah',
      'Nasai',
      'Malik',
      'Muslim',
    ];
    return Scaffold(
      body: Container(
        width: Get.width,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(
              top: Radius.circular(30),
            ),
          ),
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Pilih Hadits',
                style: blackTextBold.copyWith(fontSize: 18),
              ),
              SizedBox(
                height: 20,
              ),
              Wrap(
                children: List.generate(
                  periwayatHadits.length,
                  (index) => PilihPeriwayatHadits(
                    periwayat: periwayatHadits[index],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
