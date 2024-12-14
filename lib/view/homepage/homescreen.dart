import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix/model/model.dart';
import 'package:netflix/utils/utils.dart';
import 'package:netflix/view/widgets/widgets.dart';
import 'package:netflix/viewModel/netfilixprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    Provider.of<NetfilixProvider>(context, listen: false).getAllMovieData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Utils.main,
      body: Consumer<NetfilixProvider>(
        builder: (context, providerItemsFetch, child) {
          var listOfData = providerItemsFetch.listOfDataOfNetFlix;
          var imageBaseurl = providerItemsFetch.imagePath;

          // Ensure listOfData is not empty and contains valid data
          if (listOfData.isEmpty) {
            return Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: SafeArea(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: Colors.black.withOpacity(0.1),
                    height: 560,
                    child: Stack(
                      children: [
                        // Background Image
                        SizedBox(
                          width: double.infinity,
                          child: Positioned.fill(
                              child: Image(
                            image: NetworkImage(
                              '${providerItemsFetch.imagePath}'
                              '${providerItemsFetch.listOfDataOfNetFlix[1].poster_path},',
                            ),
                            fit: BoxFit.fitWidth,
                          )),
                        ),
                        // Gradient Overlay
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.black.withOpacity(0.7),
                                  Colors.transparent,
                                ],
                              ),
                            ),
                          ),
                        ),
                        // Content
                        SafeArea(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              // Top Bar
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: Row(
                                  children: [
                                    Container(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset('asset/netfixicon.png',
                                          fit: BoxFit.contain),
                                    ),
                                    Expanded(
                                      child: Container(
                                        width: 200,
                                        child: TextFormField(
                                          decoration: InputDecoration(
                                            hintText: 'Search',
                                            hintStyle: TextStyle(
                                                color: Utils.textColors
                                                    .withOpacity(0.3)),
                                            prefixIcon: Icon(
                                              Icons.search,
                                              color:
                                                  Colors.white.withOpacity(0.3),
                                            ),
                                            filled: true,
                                            fillColor:
                                                Colors.white.withOpacity(0.3),
                                            contentPadding: EdgeInsets.all(10),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Gap(10),
                                    Image(
                                        image:
                                            AssetImage('asset/serchicons.jpg')),
                                  ],
                                ),
                              ),
                              // Title Bar
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0, vertical: 8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      'TV Shows',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Movies',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    Text(
                                      'Categories',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(height: 8),
                                    Text(
                                      'TV Show • Supernatural • Thriller • US',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    SizedBox(height: 16),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Icon(
                                                CupertinoIcons.checkmark_alt,
                                                color: Colors.white,
                                              ),
                                              textSample(
                                                  textdetails: 'My List',
                                                  size: 15,
                                                  fontw: FontWeight.normal,
                                                  color: Colors.white),
                                            ],
                                          ),
                                          Gap(40),
                                          Container(
                                            decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            width: 100,
                                            height: 40,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(Icons.play_arrow,
                                                    color: Colors.black),
                                                Gap(5),
                                                textSample(
                                                    textdetails: 'Play',
                                                    size: 20,
                                                    fontw: FontWeight.bold,
                                                    color: Colors.black),
                                              ],
                                            ),
                                          ),
                                          Gap(40),
                                          Column(
                                            children: [
                                              Icon(Icons.info_outline,
                                                  color: Colors.white),
                                              textSample(
                                                  textdetails: 'Info',
                                                  size: 15,
                                                  fontw: FontWeight.normal,
                                                  color: Colors.white),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10, top: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        textSample(
                            textdetails: 'Releases in The Last Past Years',
                            size: 20,
                            fontw: FontWeight.bold,
                            color: Utils.textColors),
                        Gap(20),
                        Container(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              var data = providerItemsFetch
                                  .listOfDataOfNetFlix[index].backdrop_path;
                              return Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Container(
                                    height: 170,
                                    width: 140.79,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: CachedNetworkImage(
                                        imageUrl:
                                            '$imageBaseurl${providerItemsFetch.listOfDataOfNetFlix[index].poster_path}', // Use the data URL here
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ));
                            },
                          ),
                        ),
                        Gap(20),
                        textSample(
                            textdetails: 'Releases in The Last Past Years',
                            size: 20,
                            fontw: FontWeight.bold,
                            color: Utils.textColors),
                        Gap(20),
                        Container(
                          height: 200,
                          child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: 20,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 10, right: 10),
                                child: contPast(
                                    'your_image_path_here.jpg'), // Provide valid path
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

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
