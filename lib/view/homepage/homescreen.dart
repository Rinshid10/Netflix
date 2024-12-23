import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix/utils/utils.dart';
import 'package:netflix/view/homepage/homepageWidget.dart';
import 'package:netflix/view/tvShowPage/tvscreen.dart';
import 'package:netflix/view/widgets/widgets.dart';
import 'package:netflix/viewModel/netfilixprovider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    // Use addPostFrameCallback to delay the calls
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // Now you can safely call the provider methods
      Provider.of<NetfilixProvider>(context, listen: false).getAllMovieData(context);
      Provider.of<NetfilixProvider>(context, listen: false).tvUrl(context);
      Provider.of<NetfilixProvider>(context, listen: false).topratedFucntion(context);
      Provider.of<NetfilixProvider>(context, listen: false).upMovies(context);
    });
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
            return const Center(child: CircularProgressIndicator());
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
                              '${providerItemsFetch.listOfDataOfNetFlix[10].poster_path},',
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
                              const Gap(10),
                              // Top Bar
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 16.0,
                                ),
                                child: Row(
                                  children: [
                                    SizedBox(
                                      height: 40,
                                      width: 40,
                                      child: Image.asset('asset/netfixicon.png',
                                          fit: BoxFit.contain),
                                    ),
                                    Expanded(
                                      child: SizedBox(
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
                                            contentPadding: const EdgeInsets.all(10),
                                            border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                    const Gap(10),
                                    const Image(
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
                                    TextButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (ctx) => const Tvshow()));
                                      },
                                      child: const Text(
                                        'TV Shows',
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    const Text(
                                      'Movies',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    const Text(
                                      'Categories',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ),
                              const Spacer(),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const SizedBox(height: 8),
                                    const Text(
                                      'TV Show • Supernatural • Thriller • US',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 16,
                                      ),
                                    ),
                                    const SizedBox(height: 16),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 10),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              const Icon(
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
                                          const Gap(40),
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
                                                const Icon(Icons.play_arrow,
                                                    color: Colors.black),
                                                const Gap(5),
                                                textSample(
                                                    textdetails: 'Play',
                                                    size: 20,
                                                    fontw: FontWeight.bold,
                                                    color: Colors.black),
                                              ],
                                            ),
                                          ),
                                          const Gap(40),
                                          Column(
                                            children: [
                                              const Icon(Icons.info_outline,
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
                        const Gap(20),
                        fetchingContainerFromCat(
                            listNameOfCatogery:
                                providerItemsFetch.listOfDataOfNetFlix),
                        const Gap(20),
                        textSample(
                            textdetails: 'Top Rated',
                            size: 20,
                            fontw: FontWeight.bold,
                            color: Utils.textColors),
                        const Gap(20),
                        fetchingContainerFromCat(
                            listNameOfCatogery: providerItemsFetch.toprated),
                        const Gap(20),
                        textSample(
                            textdetails: 'Upcoming movies',
                            size: 20,
                            fontw: FontWeight.bold,
                            color: Utils.textColors),
                        const Gap(20),
                        fetchingContainerFromCat(
                            listNameOfCatogery:
                                providerItemsFetch.upcomingMovies),
                        const Gap(20),
                        fetchingContainerFromCat(
                            listNameOfCatogery: providerItemsFetch.tvList),
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
