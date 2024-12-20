import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/view/viewScreen/viewpage.dart';
import 'package:netflix/viewModel/netfilixprovider.dart';
import 'package:provider/provider.dart';

Widget contPast(String imagePath) {
  return Container(
    height: 170.0,
    width: 120.79,
    child: ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Image.asset(
        imagePath,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Container(
            color: Colors.grey,
            child: Icon(
              Icons.error,
              color: Colors.red,
            ),
          );
        },
      ),
    ),
  );
}

Widget fetchingContainerFromCat({required List<dynamic> listNameOfCatogery}) {
  return Consumer<NetfilixProvider>(
    builder: (context, value, child) {
      return SizedBox(
        height: 200,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: listNameOfCatogery.length,
          itemBuilder: (context, index) {
            var data = listNameOfCatogery[index];
            // var data = value.listOfDataOfNetFlix[index];
            var imageBaseurl = value.imagePath;
            return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: GestureDetector(
                  onTap: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (ctx) => ViewPage(
                              movieOrseries: data.media_type,
                              about: data.overview,
                              images: data.backdrop_path,
                              originalLan: data.original_language,
                              releaseDate: data.release_date,
                              titleName: data.title))),
                  child: SizedBox(
                    height: 170.0,
                    width: 130.79,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: CachedNetworkImage(
                        imageUrl:
                            '$imageBaseurl${data.poster_path}', // Use the data URL here
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ));
          },
        ),
      );
    },
  );
}
