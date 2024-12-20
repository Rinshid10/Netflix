import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:netflix/model/Log&signUPModel/login.dart';
import 'package:netflix/model/Log&signUPModel/lsmodel.dart';
import 'package:netflix/view/homepage/homescreen.dart';

class Userservices {
  Dio dio = Dio();
  FlutterSecureStorage storage = FlutterSecureStorage();

  void register(UserModel user, BuildContext context) async {
    try {
      final response = await dio.post(
          'https://node-project-amber.vercel.app/register',
          data: user.toJson());

      if (response.statusMessage == 201) {
        final token = response.data['token'];
        log('token got $token');
        await storage.write(key: 'Login', value: token);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        log('An error occurred: ${response.statusCode} - ${response.statusMessage}');
      }
    } catch (e) {
      if (e is DioException) {
        log('${e.response?.data} -${e.response?.statusMessage}');
      } else {
        log('$e');
      }
    }
  }

  void login(Login user, BuildContext context) async {
    try {
      final response = await dio.post(
          'https://node-project-amber.vercel.app/login',
          data: user.toJson());
      if (response.statusCode == 200) {
        final token = response.data['token'];
        log('login token $token');
        await storage.write(key: 'Login', value: token);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => HomePage()));
      } else {
        log('error in login ${response.statusMessage}-${response.statusCode}');
      }
    } catch (e) {
      if (e is DioException) {
        log(' dio eroor${e.response?.data}-${e.response?.statusCode}');
      }
    }
  }
}
