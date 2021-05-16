import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/cubit/wirid_cubit.dart';
import 'package:muslim/models/wirid.dart';
import 'package:muslim/presentation/pages/layout/detail_category_page.dart';
import 'package:muslim/presentation/utils/theme.dart';

class WiridPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DetailCategoryPage(
      pageTitle: 'Wirid',
      text: 'Wirid',
      onBack: () {
        Get.back();
      },
      child: BlocConsumer<WiridCubit, WiridState>(
        listener: (context, state) {
          if (state is WiridError) {
            return Get.snackbar('Error', state.message.toString());
          }
        },
        builder: (context, state) {
          if (state is WiridLoaded) {
            List<Wirid> wirid = state.wirid;
            return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: wirid.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              '${wirid[index].arabic} ',
                              style: GoogleFonts.amiri(fontSize: 30),
                              textAlign: TextAlign.right,
                            ),
                            Text(
                              '(dibaca ${wirid[index].times} kali)',
                              style: blackTextRegular,
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Container(
                              width: Get.width,
                              height: 2,
                              color: primaryColor2,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              },
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
