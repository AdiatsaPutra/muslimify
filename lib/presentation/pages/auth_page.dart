import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:muslim/presentation/presentation.dart';
import 'package:muslim/presentation/utils/theme.dart';
import 'package:muslim/presentation/widgets/auth_tabbar.dart';

class AuthPage extends StatefulWidget {
  @override
  _AuthPageState createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {
  int selectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(margin),
            child: Column(
              children: [
                Container(
                  height: 300,
                  width: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/illustration.png'),
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  child: AuthTabbar(
                    selectedIndex: selectedIndex,
                    titles: ['Login', 'Register'],
                    onTap: (index) {
                      setState(() {
                        selectedIndex = index;
                      });
                    },
                  ),
                ),
                SizedBox(
                  height: 16,
                ),
                (selectedIndex == 0) ? buildLogin() : buildRegister()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget buildLogin() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Username',
            labelText: 'Username',
            focusColor: primaryColor,
            labelStyle: blackTextRegular.copyWith(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
              borderSide: BorderSide(color: primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            focusColor: primaryColor,
            labelStyle: blackTextRegular.copyWith(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
              borderSide: BorderSide(color: primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 55,
          width: Get.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              Get.to(HomePage());
            },
            child: Text(
              'Masuk',
              style: whiteTextRegular.copyWith(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }

  Widget buildRegister() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Username',
            labelText: 'Username',
            focusColor: primaryColor,
            labelStyle: blackTextRegular.copyWith(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
              borderSide: BorderSide(color: primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Password',
            labelText: 'Password',
            focusColor: primaryColor,
            labelStyle: blackTextRegular.copyWith(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
              borderSide: BorderSide(color: primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        TextFormField(
          decoration: InputDecoration(
            hintText: 'Confirm Password',
            labelText: 'Confirm Password',
            focusColor: primaryColor,
            labelStyle: blackTextRegular.copyWith(color: Colors.grey),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
              borderSide: BorderSide(color: primaryColor),
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(13),
              ),
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 55,
          width: Get.width,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
              primary: primaryColor,
              elevation: 0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(13),
              ),
            ),
            onPressed: () {
              Get.to(HomePage());
            },
            child: Text(
              'Register',
              style: whiteTextRegular.copyWith(fontSize: 16),
            ),
          ),
        ),
      ],
    );
  }
}
