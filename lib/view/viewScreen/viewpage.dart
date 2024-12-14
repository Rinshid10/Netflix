import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix/utils/utils.dart';
import 'package:netflix/view/viewScreen/widgets.dart';
import 'package:netflix/view/widgets/widgets.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.main,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 300,
                    width: double.infinity,
                    child: Image(
                      image: AssetImage('asset/container_kids.jpeg'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  Gap(10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 40,
                              child: Image(
                                image: AssetImage('asset/netfixicon.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            textSample(
                              textdetails: 'S E R I E S',
                              size: 10,
                              fontw: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        Gap(10),
                        textSample(
                          textdetails: 'Stranger Things',
                          size: 25,
                          fontw: FontWeight.bold,
                          color: Colors.white,
                        ),
                        Gap(10),
                        Container(
                          width: double.infinity,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(Icons.play_arrow),
                              Gap(4),
                              textSample(
                                textdetails: 'Play',
                                size: 20,
                                fontw: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Gap(10),
                        Container(
                          width: double.infinity,
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Icon(
                                Icons.download,
                                color: Colors.white,
                              ),
                              Gap(4),
                              textSample(
                                textdetails: 'Download',
                                size: 20,
                                fontw: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ],
                          ),
                          decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.3),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        Text(
                          'rrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrrr',
                          style: TextStyle(color: Colors.white),
                        ),
                        Row(
                          children: [
                            textSample(
                              textdetails: 'Relese date:',
                              size: 15,
                              fontw: FontWeight.normal,
                              color: Colors.white.withOpacity(0.3),
                            ),
                            Gap(10),
                            textSample(
                              textdetails: '10/2/3005',
                              size: 15,
                              fontw: FontWeight.normal,
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            textSample(
                              textdetails: 'media_type',
                              size: 15,
                              fontw: FontWeight.normal,
                              color: Colors.white.withOpacity(0.3),
                            ),
                            Gap(10),
                            textSample(
                              textdetails: 'Movie',
                              size: 15,
                              fontw: FontWeight.normal,
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ],
                        ),
                        Gap(10),
                        newoneRowContainer(),
                        Gap(10),
                        textSample(
                          textdetails: 'Episods',
                          size: 20,
                          fontw: FontWeight.bold,
                          color: Colors.white,
                        ),
                        Gap(15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  return bigContainer(
                    image: 'asset/container_kids.jpeg',
                    text: 'Episods',
                  );
                },
                childCount: 10,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Widget bigContainer({required String image, required String text}) {
  return Padding(
    padding: const EdgeInsets.only(left: 20, right: 20),
    child: Stack(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 200,
              width: double.infinity,
              child: Image.asset(
                image,
                fit: BoxFit.fill,
              ),
            ),
            Gap(10),
            textSample(
              textdetails: text,
              size: 20,
              fontw: FontWeight.bold,
              color: Colors.white,
            ),
          ],
        ),
        Positioned.fill(
          child: Center(
            child: Icon(
              CupertinoIcons.play_circle,
              color: Colors.white,
              size: 50,
            ),
          ),
        ),
      ],
    ),
  );
}
