import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix/utils/utils.dart';
import 'package:netflix/view/serchScreen/serchwidget.dart';
import 'package:netflix/view/widgets/widgets.dart';
import 'package:netflix/viewModel/netfilixprovider.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NetfilixProvider>(context, listen: false).searchFcpr();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.main,
      appBar: AppBar(
        backgroundColor: Utils.main,
        title: Consumer<NetfilixProvider>(
          builder: (context, newone, child) {
            return Padding(
              padding: const EdgeInsets.only(left: 10, right: 10),
              child: TextField(
                decoration: InputDecoration(
                    hintText: 'Search',
                    hintStyle: TextStyle(color: Colors.white.withOpacity(0.5)),
                    contentPadding: EdgeInsets.all(5),
                    filled: true,
                    fillColor: Colors.white.withOpacity(0.5),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10))),
                onSubmitted: (value) {
                  newone.searchFcpr();
                },
                controller: newone.serchController,
              ),
            );
          },
        ),
      ),
      body: Consumer<NetfilixProvider>(
        builder: (context, newone, child) {
          if (newone.flag) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Gap(20),
                  textSample(
                      textdetails: "Top Searches",
                      size: 20,
                      fontw: FontWeight.bold,
                      color: Colors.white),
                  Expanded(
                    child: ListView.builder(
                      itemCount: newone.serarchlist.length,
                      itemBuilder: (context, index) {
                        var data = newone.serarchlist[index];
                        if (newone.serarchlist.isEmpty) {
                          return Center(
                            child: Row(
                              children: [
                                Icon(
                                  Icons.search,
                                  color: Colors.white,
                                  size: 60,
                                ),
                                textSample(
                                    textdetails: 'Search your movies',
                                    size: 20,
                                    fontw: FontWeight.bold,
                                    color: Colors.white)
                              ],
                            ),
                          );
                        }
                        return Padding(
                          padding: const EdgeInsets.only(bottom: 10.0),
                          child: Padding(
                            padding: const EdgeInsets.only(top: 15),
                            child: Row(
                              children: [
                                Container(
                                  height: 80,
                                  width: 120,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(5),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl:
                                          '${newone.imagePath}${data.backdrop_path}',
                                      errorWidget: (context, url, error) =>
                                          Center(
                                              child:
                                                  CircularProgressIndicator()),
                                    ),
                                  ),
                                ),
                                Gap(20),
                                Expanded(
                                  child: textSamples(
                                    textdetails: data.title ?? 'no title',
                                    size: 18,
                                    fontw: FontWeight.normal,
                                    color: Colors.white,
                                    maxLines: 1, // Limit to one line
                                    overflow:
                                        TextOverflow.ellipsis, // Use ellipsis
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(right: 10),
                                  child: Icon(
                                    CupertinoIcons.play_arrow_solid,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}