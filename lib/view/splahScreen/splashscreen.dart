import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:netflix/model/Log&signUPModel/login.dart';
import 'package:netflix/utils/utils.dart';
import 'package:netflix/view/loginAndRegistration/login/login.dart';

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
        () => Navigator.push(
            context, MaterialPageRoute(builder: (ctx) => LoginPage())));
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
