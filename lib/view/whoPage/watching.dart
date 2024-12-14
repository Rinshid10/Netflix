import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix/utils/utils.dart';
import 'package:netflix/view/whoPage/whopageWidget.dart';
import 'package:netflix/view/widgets/widgets.dart';

class WatchingPage extends StatelessWidget {
  const WatchingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.main,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Utils.main,
        title: textSample(
            textdetails: "Who's watching?",
            size: 20,
            fontw: FontWeight.bold,
            color: Utils.textColors),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 20),
            child: textSample(
                textdetails: 'Edit',
                size: 15,
                fontw: FontWeight.normal,
                color: Utils.textColors),
          )
        ],
      ),
      body: SafeArea(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WhoContainer(
                    context: context,
                    texts: 'Jay',
                    ht: 100,
                    wi: 100,
                    imagePath: 'asset/containerImage_1.jpeg'),
                WhoContainer(
                    context: context,
                    ht: 100,
                    wi: 100,
                    imagePath: 'asset/manWHo.avif',
                    texts: 'Peter'),
              ],
            ),
          ),
          Gap(10),
          Padding(
            padding: const EdgeInsets.only(left: 40, right: 40),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                WhoContainer(
                    context: context,
                    ht: 100,
                    wi: 100,
                    imagePath: 'asset/superhero.jpg',
                    texts: 'Cornel'),
                WhoContainer(
                    context: context,
                    ht: 100,
                    wi: 100,
                    imagePath: 'asset/perosnWHOOne11.jpg',
                    texts: 'Cobham'),
              ],
            ),
          ),
          Gap(20),
          WhoContainer(
              context: context,
              ht: 100,
              wi: 100,
              imagePath: 'asset/container_kids.jpeg',
              texts: 'Kids'),
        ],
      )),
    );
  }
}
