import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:muslim/cubit/kisah_nabi_cubit.dart';
import 'package:muslim/presentation/utils/theme.dart';

class KisahNabiPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<KisahNabiCubit, KisahNabiState>(
      listener: (context, state) {
        if (state is KisahNabiError) {
          return Get.snackbar('Error', state.message);
        }
      },
      builder: (context, state) {
        if (state is KisahNabiLoaded) {
          return DefaultTabController(
            length: state.kisahNabi.length,
            child: Scaffold(
              appBar: PreferredSize(
                preferredSize: Size(110, 110),
                child: SafeArea(
                  child: Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.all(margin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                                onTap: () {
                                  Get.back();
                                },
                                child: Icon(Icons.arrow_back)),
                            Text(
                              'Kumpulan Kisah 25 Nabi Dan Rasul',
                              style: blackTextBold,
                            ),
                            Icon(Icons.more_vert),
                          ],
                        ),
                      ),
                      TabBar(
                        indicatorSize: TabBarIndicatorSize.label,
                        isScrollable: true,
                        indicatorColor: primaryColor,
                        tabs: state.kisahNabi
                            .map((e) => Tab(
                                  child: Text(
                                    e.name,
                                    style: blackTextRegular,
                                  ),
                                ))
                            .toList(),
                      ),
                    ],
                  ),
                ),
              ),
              body: TabBarView(
                children: state.kisahNabi
                    .map((e) => Padding(
                          padding: const EdgeInsets.all(margin),
                          child: SingleChildScrollView(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                // Container(
                                //   width: Get.width,
                                //   height: 200,
                                //   decoration: BoxDecoration(
                                //     image: DecorationImage(
                                //       image: NetworkImage(e.imageUrl),
                                //     ),
                                //   ),
                                // ),
                                Text(
                                  e.name,
                                  style: blackTextBold,
                                ),
                                Text(
                                  'Lahir tahun: ${e.thnKelahiran}',
                                  style: blackTextRegular,
                                ),
                                Text(
                                  'Usia: ${e.usia.toString()}',
                                  style: blackTextRegular,
                                ),
                                Text(
                                  e.description,
                                  style: blackTextRegular,
                                ),
                              ],
                            ),
                          ),
                        ))
                    .toList(),
              ),
            ),
          );
        } else {
          return Scaffold(
            body: SpinKitFadingCircle(
              color: primaryColor,
            ),
          );
        }
      },
    );
  }
}
