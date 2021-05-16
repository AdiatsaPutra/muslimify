import 'package:flutter/material.dart';
import 'package:muslim/presentation/utils/theme.dart';

class QuoteBox extends StatelessWidget {
  final String text;
  final String imageUrl;

  const QuoteBox({Key? key, required this.text, required this.imageUrl})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          height: 150,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
                image: NetworkImage(imageUrl), fit: BoxFit.cover),
          ),
        ),
        Stack(
          alignment: Alignment.center,
          children: [
            Opacity(
              opacity: 0.5,
              child: Container(
                height: 150,
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: margin),
              child: Text(
                text,
                textAlign: TextAlign.center,
                style: whiteTextRegular.copyWith(
                    fontSize: 16, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
