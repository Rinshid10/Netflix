import 'package:flutter/cupertino.dart';

class Botombarprovide extends ChangeNotifier {
  int curruntIndex = 0;
  void onchanged(int index) {
    curruntIndex = index;
    notifyListeners();
  }
}
