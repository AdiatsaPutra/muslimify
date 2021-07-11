import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/cubit/tahlil_cubit.dart';
import 'package:muslim/models/models.dart';
import 'package:muslim/presentation/utils/constant.dart';
import 'package:shimmer/shimmer.dart';

class TahlilPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: BlocConsumer<TahlilCubit, TahlilState>(
          listener: (context, state) {
            if (state is TahlilError) {
              return Get.snackbar('Error', state.message);
            }
          },
          builder: (context, state) {
            return BlocBuilder<TahlilCubit, TahlilState>(
              builder: (context, state) {
                if (state is TahlilLoaded) {
                  List<Tahlil> tahlil = state.tahlil;
                  return SingleChildScrollView(
                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          'Tahlil',
                          style: blackTextBold,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        ListView.builder(
                          physics: NeverScrollableScrollPhysics(),
                          itemCount: tahlil.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 10),
                              padding: EdgeInsets.all(20),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: shadow,
                              ),
                              child: Column(
                                children: [
                                  Text(
                                    tahlil[index].title,
                                    style: blackTextRegular,
                                  ),
                                  Container(
                                    padding: EdgeInsets.all(10),
                                    child: Text(
                                      tahlil[index].arabic,
                                      style: GoogleFonts.amiri(
                                        fontSize: 20,
                                        height: 2.7,
                                      ),
                                      textAlign: TextAlign.right,
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
            );
          },
        ),
      ),
    );
  }
}
