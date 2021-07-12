import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:muslim/cubit/al_quran_cubit.dart';
import 'package:muslim/cubit/asmaul_husna_cubit.dart';
import 'package:muslim/cubit/ayat_hari_ini_cubit.dart';
import 'package:muslim/cubit/ayat_kursi_cubit.dart';
import 'package:muslim/cubit/doa_harian_cubit.dart';
import 'package:muslim/cubit/image_cubit.dart';
import 'package:muslim/cubit/kisah_nabi_cubit.dart';
import 'package:muslim/cubit/quote_cubit.dart';
import 'package:muslim/cubit/tahlil_cubit.dart';
import 'package:muslim/cubit/wirid_cubit.dart';
import 'package:muslim/models/al-quran.dart';
import 'package:muslim/models/doa_harian.dart';
import 'package:muslim/presentation/pages/home_page.dart';
import 'package:muslim/presentation/pages/main_page.dart';
import 'package:muslim/repository/api_repository.dart';

import 'models/tahlil.dart';

void main() async {
  await GetStorage.init();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => AlQuranCubit()..getAlQuran(),
        ),
        BlocProvider(
          create: (context) => AyatHariIniCubit()..getAyatHariIni(),
        ),
        BlocProvider(
          create: (context) => ImageCubit()..getImage(),
        ),
        BlocProvider(
          create: (context) => QuoteCubit()..getQuote(),
        ),
        BlocProvider(
          create: (context) => WiridCubit()..getWirid(),
        ),
        BlocProvider(
          create: (context) => AsmaulHusnaCubit()..getAsmaulHusna(),
        ),
        BlocProvider(
          create: (context) => AyatKursiCubit()..getAyatKursi(),
        ),
        BlocProvider(
          create: (context) => KisahNabiCubit()..getKisahNabi(),
        ),
        BlocProvider(
          create: (context) => TahlilCubit()..getTahlil(),
        ),
        BlocProvider(
          create: (context) => DoaHarianCubit()..getDoaHarian(),
        ),
      ],
      child: GetMaterialApp(
        theme: ThemeData(canvasColor: Colors.transparent),
        debugShowCheckedModeBanner: false,
        home: MainPage(),
      ),
    );
  }
}

class Test extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<DoaHarianCubit, DoaHarianState>(
        builder: (context, state) {
          if (state is DoaHarianLoaded) {
            List<DoaHarian> doaHarian = state.doaHarian;
            return ListView.builder(
              itemCount: doaHarian.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    Text(doaHarian[index].arabic),
                    Text(doaHarian[index].title),
                    Text(doaHarian[index].translation),
                  ],
                );
              },
            );
          } else {
            return CircularProgressIndicator();
          }
        },
      ),
    );
  }
}
