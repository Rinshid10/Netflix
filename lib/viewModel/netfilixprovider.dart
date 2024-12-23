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
  Future<void> getAllMovieData(BuildContext context) async {
    flag = true;
    notifyListeners();
    try {
      listOfDataOfNetFlix = await netFlixSer.getAllModels();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    } finally {
      flag = false;
      notifyListeners();
    }
  }

  Future<void> topratedFucntion(BuildContext context) async {
    flag = true;
    notifyListeners();
    try {
      toprated = await netFlixSer.topRated();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    } finally {
      flag = false;
      notifyListeners();
    }
  }

  Future<void> upMovies(BuildContext context) async {
    flag = true;
    notifyListeners();
    try {
      upcomingMovies = await netFlixSer.upcomingtMoves();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    } finally {
      flag = false;
      notifyListeners();
    }
  }

  Future<void> tvUrl(BuildContext context) async {
    flag = true;
    notifyListeners();
    try {
      tvList = await netFlixSer.tvShows();
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    } finally {
      flag = false;
      notifyListeners();
    }
  }

  Future<void> searchFcpr(BuildContext context) async {
    flag = true;
    notifyListeners();
    try {
      serarchlist = await netFlixSer.searchFc(movie: serchController.text);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('$e')));
    } finally {
      flag = false;
      notifyListeners();
    }
  }
}
