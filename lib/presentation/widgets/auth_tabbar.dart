import 'package:flutter/material.dart';
import 'package:muslim/presentation/utils/theme.dart';

class AuthTabbar extends StatelessWidget {
  final int selectedIndex;
  final List<String> titles;
  final Function onTap;

  const AuthTabbar(
      {Key? key,
      required this.selectedIndex,
      required this.titles,
      required this.onTap})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      child: Stack(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: titles
                .map(
                  (e) => Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          if (onTap != null) {
                            onTap(titles.indexOf(e));
                          }
                        },
                        child: Text(
                          e,
                          style: (titles.indexOf(e) == selectedIndex)
                              ? blackTextBold.copyWith(
                                  color: primaryColor,
                                  fontWeight: FontWeight.w500)
                              : blackTextRegular,
                        ),
                      ),
                      SizedBox(
                        height: 16,
                      ),
                      Container(
                        width: 100,
                        height: 3,
                        padding: EdgeInsets.only(top: 13),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(1.2),
                            color: (titles.indexOf(e) == selectedIndex)
                                ? primaryColor
                                : Colors.transparent),
                      ),
                    ],
                  ),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
