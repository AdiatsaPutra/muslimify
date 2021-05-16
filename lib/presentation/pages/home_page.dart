import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:format_indonesia/format_indonesia.dart';
import 'package:hijri/hijri_calendar.dart';
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
import 'package:muslim/presentation/widgets/random_ayat.dart';
import 'package:muslim/presentation/widgets/category.dart';
import 'package:muslim/presentation/widgets/quote_box.dart';
import 'package:shimmer/shimmer.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var tanggalHijriyah = HijriCalendar.now();
    var tanggalIndonesia = Waktu();
    return Scaffold(
      backgroundColor: backgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Stack(
                    children: [
                      Container(
                        height: 200,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage('assets/illustration.png'),
                              fit: BoxFit.cover),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 50,
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
                          InkWell(
                            onTap: () {
                              Get.to(() => KisahNabiPage());
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Row(
                              children: [
                                Text(
                                  '1 Hari 1 Ayat ',
                                  style: blackTextBold.copyWith(fontSize: 16),
                                ),
                                Text(
                                  '(Scroll ayat jika tidak muat)',
                                  style: blackTextRegular.copyWith(
                                      color: Colors.grey[800], fontSize: 12),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child:
                                BlocBuilder<AyatHariIniCubit, AyatHariIniState>(
                              builder: (context, state) {
                                if (state is AyatHariIniLoaded) {
                                  AyatHariIni ayatHariIni = state.ayatHariIni;
                                  return Container(
                                    height: 150,
                                    decoration: BoxDecoration(
                                      color: Color(0xFFD0CA9D),
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                    child: Center(
                                      child: SingleChildScrollView(
                                        physics: BouncingScrollPhysics(),
                                        child: Padding(
                                          padding: const EdgeInsets.all(margin),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: RandomAyat(
                                                  ayat: ayatHariIni.ayat,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  );
                                } else if (state is AyatHariIniError) {
                                  return Text(state.message);
                                } else {
                                  return Shimmer.fromColors(
                                      child: Container(
                                        height: 150,
                                        decoration: BoxDecoration(
                                          color: Colors.grey,
                                          borderRadius:
                                              BorderRadius.circular(10),
                                        ),
                                      ),
                                      baseColor: Colors.grey.withOpacity(0.1),
                                      highlightColor: Colors.white);
                                }
                              },
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
                                      BackgroundImage backgroundImage =
                                          state.image;
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
              Padding(
                padding: const EdgeInsets.only(top: 80),
                child: Container(
                  height: 150,
                  margin: EdgeInsets.symmetric(horizontal: margin),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2), blurRadius: 30),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(margin),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Selamat datang,',
                                  style:
                                      blackTextRegular.copyWith(fontSize: 16),
                                ),
                                Text(
                                  'User',
                                  style: blackTextBold.copyWith(fontSize: 18),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(vertical: 10),
                                  height: 1,
                                  width: Get.width / 1.5,
                                  color: Colors.grey.withOpacity(0.3),
                                ),
                                Text(
                                  '${tanggalHijriyah.hDay} '
                                  ' ${tanggalHijriyah.longMonthName} '
                                  ' ${tanggalHijriyah.hYear} H  ',
                                  style:
                                      blackTextRegular.copyWith(fontSize: 16),
                                ),
                                Text(
                                  tanggalIndonesia.yMMMMEEEEd(),
                                  style:
                                      blackTextRegular.copyWith(fontSize: 16),
                                ),
                              ],
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage('assets/1.png'),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
