import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:netflix/constants/UrlConstants/urlconstants.dart';
import 'package:netflix/model/model.dart';

class NetfilxServices {
  final baseURl = Urlconstants.baseUrl.toString();

  Dio dio = Dio(BaseOptions(
      connectTimeout: Duration(seconds: 5),
      receiveTimeout: Duration(seconds: 5)));

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
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw Exception('connection error check your internet conection');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('server error ');
      }
    }
    throw Exception('failed');
  }

  Future<List<NetflixModel>> topRated() async {
    final topUrl = Urlconstants.topRated.toString();

    try {
      final response = await dio.get(topUrl);
      if (response.statusCode == 200) {
        log('fecthing succuess toprated');
        List data = response.data['results'];
        return data.map((e) => NetflixModel.fromJson(e)).toList();
      } else {
        throw Exception('erro found in feacthing');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw Exception('connection error check your internet conection');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('server error ');
      }
    }
    return [];
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
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw Exception('connection error check your internet conection');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('server error ');
      }
    }
    throw Exception('empty data');
  }

  Future<List<NetflixModel>> tvShows() async {
    final tvUrl = Urlconstants.tvshows.toString();
    try {
      final response = await dio.get(tvUrl);
      if (response.statusCode == 200) {
        log('fecthing succuess toprated');
        List data = response.data['results'];
        return data.map((e) => NetflixModel.fromJson(e)).toList();
      } else {
        throw Exception('erro found in feacthing');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw Exception('connection error check your internet conection');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('server error ');
      }
    }
    throw Exception('empty data');
  }

  Future<List<NetflixModel>> searchFc({required String movie}) async {
    final searchUrl = '${Urlconstants.search.toString()}$movie';
    try {
      final response = await dio.get(searchUrl);
      if (response.statusCode == 200) {
        log('fecthing succuess toprated');
        List data = response.data['results'];
        return data.map((e) => NetflixModel.fromJson(e)).toList();
      } else {
        throw Exception('erro found in feacthing');
      }
    } on DioException catch (e) {
      if (e.type == DioExceptionType.connectionError) {
        throw Exception('connection error check your internet conection');
      } else if (e.type == DioExceptionType.receiveTimeout) {
        throw Exception('server error ');
      }
    }
    throw Exception('empty data');
  }
}
