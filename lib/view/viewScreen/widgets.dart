import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix/view/widgets/widgets.dart';

Widget newoneRowContainer() {
  return Row(
    children: [
      continerIWithColum(icon: CupertinoIcons.checkmark_alt, name: 'My List'),
      Gap(20),
      continerIWithColum(icon: CupertinoIcons.hand_thumbsup, name: 'Rate'),
      Gap(20),
      continerIWithColum(icon: Icons.share, name: 'Share'),
    ],
  );
}

Widget continerIWithColum({required IconData icon, required String name}) {
  return Column(
    children: [
      Icon(
        icon,
        color: Colors.white,
      ),
      textSample(
          textdetails: name,
          size: 15,
          fontw: FontWeight.normal,
          color: Colors.white),
    ],
  );
}

Widget RowConatainer(
    {required String images, required String text1, required String text2}) {
  return Container(
    height: 100,
    width: double.infinity,
    child: Row(
      children: [
        Container(
          height: double.infinity,
          width: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Image(
              image: AssetImage(images),
              fit: BoxFit.cover,
            ),
          ),
        ),
        Gap(10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textSample(
                textdetails: text1,
                size: 15,
                fontw: FontWeight.bold,
                color: Colors.white),
            textSample(
                textdetails: text2,
                size: 15,
                fontw: FontWeight.bold,
                color: Colors.white38),
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Icon(
            CupertinoIcons.arrow_down_to_line,
            color: Colors.white,
            size: 30,
          ),
        )
      ],
    ),
  );
}
