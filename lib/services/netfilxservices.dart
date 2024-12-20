import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:netflix/constants/UrlConstants/urlconstants.dart';
import 'package:netflix/model/model.dart';

class NetfilxServices {
  final baseURl = Urlconstants.baseUrl.toString();

  Dio dio = Dio();

  Future<List<NetflixModel>> getAllModels() async {
    try {
      final response = await dio.get(baseURl);
      if (response.statusCode == 200) {
        log('fecthing succuess');
        List data = response.data['results'];
        return data.map((e) => NetflixModel.fromJson(e)).toList();
      } else {
        throw Exception('erro found in feacthing');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<NetflixModel>> topRated() async {
    final topUrl = Urlconstants.topRated.toString();

    Dio dio = Dio();

    try {
      final response = await dio.get(topUrl);
      if (response.statusCode == 200) {
        log('fecthing succuess toprated');
        List data = response.data['results'];
        return data.map((e) => NetflixModel.fromJson(e)).toList();
      } else {
        throw Exception('erro found in feacthing');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<NetflixModel>> upcomingtMoves() async {
    final latesUrl = Urlconstants.upcoming.toString();
        
    Dio dio = Dio();

    try {
      final response = await dio.get(latesUrl);
      if (response.statusCode == 200) {
        log('fecthing succuess toprated');
        List data = response.data['results'];
        return data.map((e) => NetflixModel.fromJson(e)).toList();
      } else {
        throw Exception('erro found in feacthing');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<NetflixModel>> tvShows() async {
    final tvUrl =
       Urlconstants.tvshows.toString();
    Dio dio = Dio();

    try {
      final response = await dio.get(tvUrl);
      if (response.statusCode == 200) {
        log('fecthing succuess toprated');
        List data = response.data['results'];
        return data.map((e) => NetflixModel.fromJson(e)).toList();
      } else {
        throw Exception('erro found in feacthing');
      }
    } catch (e) {
      throw Exception(e);
    }
  }

  Future<List<NetflixModel>> searchFc({required String movie}) async {
    final searchUrl =
        '${ Urlconstants.search.toString()}$movie';
    Dio dio = Dio();

    try {
      final response = await dio.get(searchUrl);
      if (response.statusCode == 200) {
        log('fecthing succuess toprated');
        List data = response.data['results'];
        return data.map((e) => NetflixModel.fromJson(e)).toList();
      } else {
        throw Exception('erro found in feacthing');
      }
    } catch (e) {
      throw Exception(e);
    }
  }


}
