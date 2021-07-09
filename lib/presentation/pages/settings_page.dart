import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim/presentation/utils/constant.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Pengaturan',
                  style: blackTextBold.copyWith(fontSize: 20),
                ),
                SizedBox(
                  height: 20,
                ),
                Text(
                  'Pengaturan Umum',
                  style: blackTextBold.copyWith(fontSize: 17),
                ),
                SizedBox(
                  height: 20,
                ),
                buildtilePengaturan(
                  'Mode Gelap',
                  Switch(
                    activeColor: primaryColor,
                    value: true,
                    onChanged: (bool newValue) {},
                  ),
                ),
                Text(
                  'Tentang',
                  style: blackTextBold.copyWith(fontSize: 17),
                ),
                SizedBox(
                  height: 20,
                ),
                buildtilePengaturan(
                  'Mode Gelap',
                  SizedBox(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildtilePengaturan(String text, Widget widget) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: 20,
      ),
      child: Container(
        height: 50,
        width: Get.width,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: shadow,
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(text),
              widget,
            ],
          ),
        ),
      ),
    );
  }
}
