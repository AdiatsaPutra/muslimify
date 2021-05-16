import 'package:flutter/material.dart';
import 'package:muslim/presentation/utils/theme.dart';

class DetailCategoryPage extends StatelessWidget {
  final String pageTitle;
  final String text;
  final Widget? child;
  final Function? onBack;
  final bool? isSearch;

  const DetailCategoryPage({
    Key? key,
    required this.pageTitle,
    required this.text,
    this.child,
    this.onBack,
    this.isSearch = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          physics: ScrollPhysics(),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: margin, vertical: 20),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () {
                        onBack!();
                      },
                      child: Icon(Icons.arrow_back),
                    ),
                    Text(
                      pageTitle,
                      style: blackTextBold.copyWith(
                        fontSize: 18,
                        color: primaryColor,
                      ),
                    ),
                    InkWell(
                      onTap: () {},
                      child: Icon(Icons.more_vert),
                    ),
                  ],
                ),
                SizedBox(
                  height: 30,
                ),
                (isSearch == true)
                    ? TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(width: 2, color: primaryColor),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(30),
                            borderSide:
                                BorderSide(width: 2, color: primaryColor),
                          ),
                          suffixIcon: Icon(Icons.search, color: primaryColor),
                          labelText: 'Cari ${text}',
                          labelStyle:
                              blackTextRegular.copyWith(color: Colors.grey),
                        ),
                      )
                    : Container(),
                child ?? SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
