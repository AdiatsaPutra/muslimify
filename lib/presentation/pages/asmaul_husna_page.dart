import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:muslim/cubit/asmaul_husna_cubit.dart';
import 'package:muslim/models/asmaul_husna.dart';
import 'package:muslim/presentation/pages/layout/detail_category_page.dart';
import 'package:muslim/presentation/utils/theme.dart';

class AsmaulHusnaPage extends StatefulWidget {
  @override
  _AsmaulHusnaPageState createState() => _AsmaulHusnaPageState();
}

class _AsmaulHusnaPageState extends State<AsmaulHusnaPage> {
  TextEditingController asmaulHusnaSearch = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return DetailCategoryPage(
      pageTitle: 'Asmaul Husna',
      text: 'Asmaul Husna',
      onBack: () {
        Get.back();
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            TextField(
              controller: asmaulHusnaSearch,
              onChanged: (value) {
                setState(() {});
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 2, color: primaryColor),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                  borderSide: BorderSide(width: 2, color: primaryColor),
                ),
                suffixIcon: Icon(Icons.search, color: primaryColor),
                labelText: 'Cari Asmaul Husna',
                labelStyle: blackTextRegular.copyWith(color: Colors.grey),
              ),
            ),
            BlocConsumer<AsmaulHusnaCubit, AsmaulHusnaState>(
              listener: (context, state) {
                if (state is AsmaulHusnaError) {
                  return Get.snackbar('Error', state.message.toString());
                }
              },
              builder: (context, state) {
                if (state is AsmaulHusnaLoaded) {
                  List<AsmaulHusna> asmaulHusna = state.asmaulHusna;
                  return ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: asmaulHusna.length,
                    itemBuilder: (context, index) {
                      if (asmaulHusnaSearch.text.isEmpty) {
                        return Container(
                          padding: const EdgeInsets.all(24),
                          margin: const EdgeInsets.only(top: 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                            boxShadow: shadow,
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    Text(
                                      '${asmaulHusna[index].arabic} ',
                                      style: GoogleFonts.amiri(fontSize: 30),
                                      textAlign: TextAlign.right,
                                    ),
                                    Text(
                                      '${asmaulHusna[index].latin} ',
                                      style: GoogleFonts.amiri(fontSize: 20),
                                      textAlign: TextAlign.right,
                                    ),
                                    Text(
                                      '${asmaulHusna[index].translationId} ',
                                      style: blackTextRegular,
                                      textAlign: TextAlign.right,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        );
                      } else if (asmaulHusna[index]
                              .latin
                              .toLowerCase()
                              .contains(asmaulHusnaSearch.text) ||
                          asmaulHusna[index]
                              .latin
                              .toLowerCase()
                              .contains(asmaulHusnaSearch.text)) {
                        return Padding(
                          padding: const EdgeInsets.all(24.0),
                          child: Container(
                            padding: const EdgeInsets.all(24),
                            margin: const EdgeInsets.only(top: 10),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: shadow,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        '${asmaulHusna[index].arabic} ',
                                        style: GoogleFonts.amiri(fontSize: 30),
                                        textAlign: TextAlign.right,
                                      ),
                                      Text(
                                        '${asmaulHusna[index].latin} ',
                                        style: GoogleFonts.amiri(fontSize: 20),
                                        textAlign: TextAlign.right,
                                      ),
                                      Text(
                                        '${asmaulHusna[index].translationId} ',
                                        style: blackTextRegular,
                                        textAlign: TextAlign.right,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      } else {
                        return Container();
                      }
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
          ],
        ),
      ),
    );
  }
}
