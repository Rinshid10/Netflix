import 'package:flutter/material.dart';
import 'package:netflix/utils/utils.dart';
import 'package:netflix/view/downloadsPage/downloads.dart';
import 'package:netflix/view/homepage/homescreen.dart';
import 'package:netflix/view/serchScreen/search.dart';
import 'package:netflix/view/splahScreen/splashscreen.dart';
import 'package:netflix/viewModel/botombarProvider.dart';
import 'package:provider/provider.dart';

class BottomScreen extends StatelessWidget {
  BottomScreen({super.key});
  final pages = [
    HomePage(),
    const SearchPage(),
    const SplashScreen(),
    const DownloadPage()
  ];

  @override
  Widget build(BuildContext context) {
    return Consumer<Botombarprovide>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Colors.black,
        body: pages[value.curruntIndex],
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Utils.main,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey,
          onTap: (index) {
            value.onchanged(index);
          },
          currentIndex: value.curruntIndex,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: 'Search'),
            BottomNavigationBarItem(
                icon: Icon(Icons.video_library), label: 'View'),
            BottomNavigationBarItem(
                icon: Icon(Icons.download), label: 'Downloads'),
          ],
        ),
      ),
    );
  }
}
