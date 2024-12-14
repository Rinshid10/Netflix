import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix/utils/utils.dart';
import 'package:netflix/view/widgets/widgets.dart';

class DownloadPage extends StatelessWidget {
  const DownloadPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.main,
      appBar: AppBar(
        backgroundColor: Utils.main,
        title: textSample(
            textdetails: "My Downloads",
            size: 25,
            fontw: FontWeight.bold,
            color: Colors.white),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 15),
            child: Row(
              children: [
                Icon(
                  Icons.library_add,
                  color: Colors.white,
                ),
                Gap(15),
                Icon(
                  Icons.person,
                  color: Colors.white,
                ),
              ],
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        child: SafeArea(
            child: Column(
          children: [
            Container(
              height: 50,
              width: double.infinity,
              color: const Color.fromARGB(255, 47, 46, 46),
              child: Padding(
                padding: const EdgeInsets.only(left: 20),
                child: Row(
                  children: [
                    Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    Gap(10),
                    textSample(
                        textdetails: 'Smart Downloads',
                        size: 15,
                        fontw: FontWeight.bold,
                        color: Colors.white),
                    Gap(10),
                    textSample(
                        textdetails: 'ON',
                        size: 15,
                        fontw: FontWeight.w900,
                        color: Colors.blue),
                  ],
                ),
              ),
            ),
            TextFormField(
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                  )),
            ),
            Gap(10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListView.builder(
                physics: NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(3),
                    child: Card(
                        elevation: 3,
                        color: Utils.main,
                        child: continerInDownload()),
                  );
                },
              ),
            )
          ],
        )),
      ),
    );
  }
}

Widget continerInDownload() {
  return Container(
    height: 100,
    width: double.infinity,
    child: Row(
      children: [
        Container(
          height: double.infinity,
          width: 150,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(3),
            child: Image(
              image: AssetImage('asset/spider.webp'),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Gap(10),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            textSample(
                textdetails: 'Spider man2',
                size: 15,
                fontw: FontWeight.normal,
                color: Colors.white),
            textSample(
                textdetails: 'Downloading...',
                size: 15,
                fontw: FontWeight.bold,
                color: Colors.white60),
          ],
        ),
        Spacer(),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Icon(
            Icons.keyboard_arrow_right,
            color: Colors.white60,
            size: 40,
          ),
        )
      ],
    ),
  );
}
