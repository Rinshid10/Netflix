import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:netflix/model/model.dart';
import 'package:netflix/services/netfilxservices.dart';

class NetfilixProvider extends ChangeNotifier {
  String imagePath = 'https://image.tmdb.org/t/p/w400/';
  NetfilxServices netFlixSer = NetfilxServices();
  List<NetflixModel> listOfDataOfNetFlix = [];
  List<NetflixModel> toprated = [];
  List<NetflixModel> upcomingMovies = [];
  List<NetflixModel> tvList = [];
  List<NetflixModel> serarchlist = [];
  TextEditingController serchController = TextEditingController();
  bool flag = false;
  Future<void> getAllMovieData() async {
    flag = true;
    notifyListeners();
    try {
      listOfDataOfNetFlix = await netFlixSer.getAllModels();
    } catch (e) {
      log('error found');
    } finally {
      flag = false;
      notifyListeners();
    }
  }

  Future<void> topratedFucntion() async {
    flag = true;
    notifyListeners();
    try {
      toprated = await netFlixSer.topRated();
    } catch (e) {
      log('error found in toprated movies api');
    } finally {
      flag = false;
      notifyListeners();
    }
  }

  Future<void> upMovies() async {
    flag = true;
    notifyListeners();
    try {
      upcomingMovies = await netFlixSer.upcomingtMoves();
    } catch (e) {
      log('error found in latest movies api');
    } finally {
      flag = false;
      notifyListeners();
    }
  }

  Future<void> tvUrl() async {
    flag = true;
    notifyListeners();
    try {
      tvList = await netFlixSer.tvShows();
    } catch (e) {
      log('error found in tvurl movies api');
    } finally {
      flag = false;
      notifyListeners();
    }
  }

  Future<void> searchFcpr() async {
    flag = true;
    notifyListeners();
    try {
      serarchlist = await netFlixSer.searchFc(movie: serchController.text);
    } catch (e) {
      log('error found in tvurl movies api');
    } finally {
      flag = false;
      notifyListeners();
    }
  }
}
