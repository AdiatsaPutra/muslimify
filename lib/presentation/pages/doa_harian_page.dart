import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:muslim/cubit/doa_harian_cubit.dart';
import 'package:muslim/models/models.dart';
import 'package:muslim/presentation/pages/layout/detail_category_page.dart';
import 'package:muslim/presentation/utils/constant.dart';
import 'package:shimmer/shimmer.dart';

class DoaHarianPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DetailCategoryPage(
      pageTitle: 'Doa Harian',
      text: 'text',
      child: BlocConsumer<DoaHarianCubit, DoaHarianState>(
        listener: (context, state) {
          if (state is DoaHarianError) {
            Get.snackbar('Periksa Koneksi Anda', state.message);
          }
        },
        builder: (context, state) {
          return BlocBuilder<DoaHarianCubit, DoaHarianState>(
            builder: (context, state) {
              if (state is DoaHarianLoaded) {
                List<DoaHarian> doaHarian = state.doaHarian;
                return SingleChildScrollView(
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: doaHarian.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(
                          bottom: 10,
                        ),
                        padding: EdgeInsets.all(20),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: shadow,
                        ),
                        child: Column(
                          children: [
                            Text(doaHarian[index].arabic),
                            Text(doaHarian[index].title),
                            Text(doaHarian[index].translation),
                          ],
                        ),
                      );
                    },
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
      onBack: () {
        Get.back();
      },
    );
  }
}
