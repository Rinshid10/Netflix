import 'package:flutter/cupertino.dart';

Widget textSamples({
  required String textdetails,
  required double size,
  required FontWeight fontw,
  required Color color,
  int maxLines = 1,
  TextOverflow overflow = TextOverflow.ellipsis,
}) {
  return Text(
    textdetails,
    overflow: overflow,
    maxLines: maxLines,
    style: TextStyle(
      fontSize: size,
      fontWeight: fontw,
      color: color,
    ),
  );
}
