import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix/utils/utils.dart';
import 'package:netflix/view/tvShowPage/tvwidget.dart';
import 'package:netflix/view/widgets/widgets.dart';
import 'package:netflix/viewModel/netfilixprovider.dart';
import 'package:provider/provider.dart';

class Tvshow extends StatelessWidget {
  const Tvshow({super.key});

  @override
  Widget build(BuildContext context) {
    Provider.of<NetfilixProvider>(context, listen: false).tvUrl();
    final listTv = Provider.of<NetfilixProvider>(context, listen: false).tvList;
    return Consumer<NetfilixProvider>(
      builder: (context, value, child) => Scaffold(
        backgroundColor: Utils.main,
        body: ListView.builder(
          itemCount: value.tvList.length,
          itemBuilder: (context, index) {
            return Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(left: 15, right: 15, bottom: 10),
                  height: 150,
                  width: double.infinity,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image(
                      image: NetworkImage(
                          '${value.imagePath}${value.tvList[index].backdrop_path}'),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                    bottom: 20,
                    right: 25,
                    child: Icon(
                      CupertinoIcons.play_circle,
                      color: Colors.white,
                      size: 50,
                    )),
                Positioned(
                  bottom: 15,
                  left: 25,
                  child: textSample(
                      textdetails: 'Name',
                      size: 15,
                      fontw: FontWeight.bold,
                      color: Colors.white),
                )
              ],
            );
          },
        ),
      ),
    );
  }
}
