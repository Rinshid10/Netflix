import 'package:flutter/material.dart';

Widget textSample(
    {required String textdetails,
    required double size,
    required FontWeight fontw,
    required Color color}) {
  return Text(
    textdetails,
    overflow: TextOverflow.ellipsis,
    maxLines: 2,
    style: TextStyle(
      fontSize: size,
      fontWeight: fontw,
      color: color,
    ),
  );
}
