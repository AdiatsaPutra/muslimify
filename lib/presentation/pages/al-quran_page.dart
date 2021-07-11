import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/cubit/al_quran_cubit.dart';
import 'package:muslim/models/al-quran.dart';
import 'package:muslim/presentation/utils/constant.dart';

class AlQuranPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocBuilder<AlQuranCubit, AlQuranState>(
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
                              Text(
                                alQuran[index].nomor.toString(),
                                style: GoogleFonts.amiri(
                                  fontSize: 25,
                                  height: 2.3,
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Row(
                                children: [
                                  Column(
                                    children: [
                                      Text(
                                        alQuran[index].asma,
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.amiri(
                                          fontSize: 25,
                                          height: 2.3,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                      Text(
                                        alQuran[index].nama,
                                        textAlign: TextAlign.right,
                                        style: GoogleFonts.amiri(
                                          fontSize: 16,
                                          height: 2.3,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ],
                ),
              );
            }
            return CircularProgressIndicator();
          },
        ),
      ),
    );
  }
}
