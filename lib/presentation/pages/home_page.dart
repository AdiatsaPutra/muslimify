import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:line_icons/line_icon.dart';
import 'package:muslim/cubit/ayat_hari_ini_cubit.dart';
import 'package:muslim/cubit/image_cubit.dart';
import 'package:muslim/cubit/quote_cubit.dart';
import 'package:muslim/models/ayat_hari_ini.dart';
import 'package:muslim/models/image.dart';
import 'package:muslim/models/quote.dart';
import 'package:muslim/presentation/pages/kisah_nabi_page.dart';
import 'package:muslim/presentation/presentation.dart';
import 'package:muslim/presentation/utils/list.dart';
import 'package:muslim/presentation/utils/routes.dart';
import 'package:muslim/presentation/utils/theme.dart';
import 'package:muslim/presentation/widgets/ayat_hari_ini_box.dart';
import 'package:muslim/presentation/widgets/category.dart';
import 'package:muslim/presentation/widgets/quote_box.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 20),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        children: [
                          Text(
                            'Muslim',
                            style: blackTextBold.copyWith(
                              fontSize: 30,
                              color: primaryColor,
                            ),
                          ),
                          Container(
                            width: 37,
                            height: 37,
                            child: Image.asset('assets/1.png'),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 20),
                      child: Text(
                        'Satu hari satu ayat (scroll jika tidak muat)',
                        style: blackTextBold,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 10, 20, 0),
                      child: BlocBuilder<AyatHariIniCubit, AyatHariIniState>(
                        builder: (context, state) {
                          if (state is AyatHariIniLoaded) {
                            AyatHariIni ayatHariIni = state.ayatHariIni;
                            return BlocBuilder<ImageCubit, ImageState>(
                              builder: (context, state) {
                                if (state is ImageLoaded) {
                                  BackgroundImage backgroundImage = state.image;
                                  return AyatHariIniBox(
                                      backgroundImage: backgroundImage,
                                      ayatHariIni: ayatHariIni);
                                }
                                return Shimmer.fromColors(
                                  child: Container(
                                    height: 150,
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
                          } else if (state is AyatHariIniError) {
                            return Text(state.message);
                          } else {
                            return Shimmer.fromColors(
                              child: Container(
                                height: 150,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                              baseColor: Colors.grey.withOpacity(0.1),
                              highlightColor: Colors.white,
                            );
                          }
                        },
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(margin),
                child: Wrap(
                  spacing: 15,
                  runSpacing: 15,
                  children: List.generate(
                    8,
                    (index) => Category(
                      text: category[index],
                      onTap: categoryRoutes[index],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Container(
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.all(margin),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Kisah 25 Nabi dan Rasul',
                        style: blackTextBold,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          Get.to(
                            () => KisahNabiPage(),
                          );
                        },
                        child: Container(
                          width: Get.width,
                          height: 100,
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                              ),
                              SizedBox(
                                height: 75,
                                child: Image.asset('assets/3.png'),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Kisah Nabi',
                                    style: whiteTextBold,
                                  ),
                                  Text(
                                    'Kumpulan kisah 25 nabi dan rasul',
                                    style: whiteTextRegular,
                                  ),
                                ],
                              )
                            ],
                          ),
                          decoration: BoxDecoration(
                              color: primaryColor.withOpacity(0.7),
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: shadow),
                        ),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Quote hari ini',
                        style: blackTextBold.copyWith(fontSize: 16),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      BlocBuilder<QuoteCubit, QuoteState>(
                        builder: (context, state) {
                          if (state is QuoteLoaded) {
                            Quote quote = state.quote;
                            return BlocBuilder<ImageCubit, ImageState>(
                              builder: (context, state) {
                                if (state is ImageLoaded) {
                                  BackgroundImage backgroundImage = state.image;
                                  return QuoteBox(
                                      text: quote.textId,
                                      imageUrl: backgroundImage.image);
                                }
                                return SpinKitFadingCircle(
                                  color: primaryColor,
                                );
                              },
                            );
                          } else if (state is QuoteError) {
                            return Text(state.message);
                          } else {
                            return Shimmer.fromColors(
                                child: Container(
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.grey,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                                baseColor: Colors.grey.withOpacity(0.1),
                                highlightColor: Colors.white);
                          }
                        },
                      )
                    ],
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
