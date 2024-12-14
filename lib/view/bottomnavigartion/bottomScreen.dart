import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/view/downloadsPage/downloads.dart';
import 'package:netflix/view/homepage/homescreen.dart';
import 'package:netflix/view/splahScreen/splashscreen.dart';
import 'package:netflix/view/viewScreen/viewpage.dart';
import 'package:netflix/viewModel/botombarProvider.dart';
import 'package:provider/provider.dart';

class BottomScreen extends StatelessWidget {
  BottomScreen({super.key});
  final pages = [HomePage(), SplashScreen(), ViewPage(), DownloadPage()];

  @override
  Widget build(BuildContext context) {
    return Consumer<Botombarprovide>(
      builder: (context, value, child) => Scaffold(
        body: pages[value.curruntIndex],
        bottomNavigationBar: BottomNavigationBar(
            onTap: (values) {
              value.onchanged(values);
            },
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
              BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            ]),
      ),
    );
  }
}
