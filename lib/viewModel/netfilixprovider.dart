import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:netflix/model/model.dart';
import 'package:netflix/services/netfilxservices.dart';

class NetfilixProvider extends ChangeNotifier {
  String imagePath = 'https://image.tmdb.org/t/p/w500/';
  NetfilxServices netFlixSer = NetfilxServices();
  List<NetflixModel> listOfDataOfNetFlix = [];
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
}
