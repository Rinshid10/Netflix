import 'package:flutter/material.dart';
import 'package:netflix/view/bottomnavigartion/bottomScreen.dart';
import 'package:netflix/view/downloadsPage/downloads.dart';
import 'package:netflix/view/homepage/homescreen.dart';

import 'package:netflix/view/serchScreen/search.dart';
import 'package:netflix/view/splahScreen/splashscreen.dart';
import 'package:netflix/view/tvShowPage/tvscreen.dart';
import 'package:netflix/view/viewScreen/viewpage.dart';

import 'package:netflix/view/whoPage/watching.dart';
import 'package:netflix/view/whoPage/whopageWidget.dart';
import 'package:netflix/viewModel/botombarProvider.dart';
import 'package:netflix/viewModel/downloads.dart';
import 'package:netflix/viewModel/netfilixprovider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => DownloadsProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => NetfilixProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => Botombarprovide(),
        )
      ],
      child: MaterialApp(
        home: SplashScreen(),
      ),
    );
  }
}
