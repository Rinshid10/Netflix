import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/view/bottomnavigartion/bottomScreen.dart';
import 'package:netflix/utils/utils.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(
        Duration(seconds: 4),
        () => Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => BottomScreen()),
              (route) => false,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.main,
      body: SafeArea(
          child: Container(
              width: double.infinity,
              height: double.infinity,
              child: Lottie.asset('asset/Netflix_animations.json'))),
    );
  }
}
