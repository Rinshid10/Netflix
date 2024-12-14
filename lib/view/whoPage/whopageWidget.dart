import 'package:flutter/material.dart';
import 'package:netflix/utils/utils.dart';
import 'package:netflix/view/homepage/homescreen.dart';
import 'package:netflix/view/widgets/widgets.dart';

Widget WhoContainer({
  required BuildContext context,
  required double ht,
  required double wi,
  required String imagePath,
  required String texts,
}) {
  return Column(
    children: [
      GestureDetector(
        onTap: () {
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (ctx) => HomePage()));
        },
        child: Container(
          height: ht,
          width: wi,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              fit: BoxFit.cover, // Ensure the image covers the container
            ),
          ),
        ),
      ),
      textSample(
          textdetails: texts,
          size: 15,
          fontw: FontWeight.normal,
          color: Utils.textColors)
    ],
  );
}
