import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/cubit/al_quran_cubit.dart';
import 'package:muslim/models/al-quran.dart';
import 'package:muslim/presentation/utils/constant.dart';
import 'package:shimmer/shimmer.dart';

class AlQuranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<AlQuranCubit, AlQuranState>(
          listener: (context, state) {
            if (state is AlQuranError) {
              Get.snackbar('Periksa Koneksi Anda', state.message);
            }
          },
          builder: (context, state) {
            if (state is AlQuranLoaded) {
              List<AlQuran> alQuran = state.alQuran;
              return SingleChildScrollView(
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'AlQuran',
                      style: blackTextBold,
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemCount: alQuran.length,
                      itemBuilder: (context, index) {
                        return Container(
                          margin: EdgeInsets.fromLTRB(20, 0, 20, 20),
                          padding: EdgeInsets.symmetric(horizontal: 20),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            boxShadow: shadow,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    alQuran[index].nomor.toString(),
                                    style: GoogleFonts.amiri(
                                      fontSize: 20,
                                      height: 2.3,
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(
                                    width: 20,
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        alQuran[index].nama,
                                        style: blackTextRegular,
                                      ),
                                      Text(
                                        '${alQuran[index].type} - ${alQuran[index].ayat} ayat',
                                        style: blackTextRegular.copyWith(
                                          color: Colors.grey,
                                          fontSize: 13,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Text(
                                alQuran[index].asma,
                                textAlign: TextAlign.right,
                                style: GoogleFonts.amiri(
                                  fontSize: 25,
                                  height: 2.3,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            } else {
              return ListView.builder(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Shimmer.fromColors(
                    child: Container(
                      height: 100,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                        color: Colors.grey,
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    baseColor: Colors.grey.withOpacity(0.1),
                    highlightColor: Colors.white,
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
