import 'dart:developer';
import 'dart:ui';

import 'package:dio/dio.dart';
import 'package:netflix/model/model.dart';

class NetfilxServices {
  Dio dio = Dio();

  Future<List<NetflixModel>> getAllModels() async {
    final baseURl =
        'https://api.themoviedb.org/3/trending/movie/day?api_key=d26a8dd97ecb04414d11287cd30cca91';
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

  Future<List<NetflixModel>> popUlarmovie() async {
    final baseURl =
        'https://api.themoviedb.org/3/movie/popular?api_key=d26a8dd97ecb04414d11287cd30cca91';
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

  Future<List<NetflixModel>> toprated({required String movies}) async {
    final baseURll =
        'https://api.themoviedb.org/3/movie/top_rated?api_key=d26a8dd97ecb04414d11287cd30cca91';

    try {
      final response = await dio.get(baseURll);
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

  Future<List<NetflixModel>> displyDetails({required int id}) async {
    final baseURll =
        'https://api.themoviedb.org/3/tv/$id?api_key=d26a8dd97ecb04414d11287cd30cca91';

    try {
      final response = await dio.get(baseURll);
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

  Future<List<NetflixModel>> search({required int movie}) async {
    final baseURll =
        'https://api.themoviedb.org/3/search/multi?api_key=d26a8dd97ecb04414d11287cd30cca91&query=$movie';

    try {
      final response = await dio.get(baseURll);
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

  dispay() {
    getAllModels().then((value) {
      print(value.first.title);
    });
  }
}
