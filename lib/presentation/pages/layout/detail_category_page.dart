import 'package:flutter/material.dart';
import 'package:muslim/presentation/utils/theme.dart';

class DetailCategoryPage extends StatelessWidget {
  final String pageTitle;
  final String text;
  final Widget? child;
  final Function? onBack;

  const DetailCategoryPage({
    Key? key,
    required this.pageTitle,
    required this.text,
    this.child,
    this.onBack,
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
                child ?? SizedBox()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
