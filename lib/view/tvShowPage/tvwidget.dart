import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix/viewModel/netfilixprovider.dart';
import 'package:provider/provider.dart';

Widget tvItemsWIdget({required List<dynamic> listNameOfCatogery}) {
  return Consumer<NetfilixProvider>(
    builder: (context, value, child) {
      return SizedBox(
        child: ListView.builder(
          itemCount: listNameOfCatogery.length,
          itemBuilder: (context, index) {
            // var data = providerItemsFetch.listOfDataOfNetFlix[index].backdrop_path;
            var data = listNameOfCatogery[index];
            var imageBaseurl = value.imagePath;
            return Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: Card(
                  child: SizedBox(
                    height: 170.0,
                    width: 130.79,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: CachedNetworkImage(
                          imageUrl:
                              '$imageBaseurl${data.poster_path}', // Use the data URL here
                          fit: BoxFit.fitWidth,
                        ),
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
