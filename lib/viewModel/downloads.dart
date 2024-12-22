import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:netflix/model/model.dart';

class DownloadsProvider extends ChangeNotifier {
  List<NetflixModel> dowloads = [];

  void addDownloads(List<NetflixModel> adddatas) {
    dowloads.addAll(adddatas);
    log(adddatas.toString());
    notifyListeners();
  }
}
