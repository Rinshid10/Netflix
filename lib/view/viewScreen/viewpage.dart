import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix/utils/utils.dart';
import 'package:netflix/view/viewScreen/widgets.dart';
import 'package:netflix/view/widgets/widgets.dart';
import 'package:netflix/viewModel/downloads.dart';
import 'package:netflix/viewModel/netfilixprovider.dart';
import 'package:provider/provider.dart';

class ViewPage extends StatelessWidget {
  final String? titleName;
  final String? originalLan;
  final String? images;
  final String? about;
  final String? releaseDate;
  final String? movieOrseries;
  final int index;

  ViewPage({
    super.key,
    required this.about,
    required this.movieOrseries,
    required this.images,
    required this.originalLan,
    required this.releaseDate,
    required this.titleName,
    required this.index,
  });

  @override
  Widget build(BuildContext context) {
    final value = movieOrseries?.split('') ?? [];
    String formattedTitle = value.join(' ').toUpperCase();

    return Scaffold(
      backgroundColor: Utils.main,
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        height: 300,
                        width: double.infinity,
                        child: CachedNetworkImage(
                          imageUrl: images != null
                              ? 'https://image.tmdb.org/t/p/w400/$images'
                              : 'https://via.placeholder.com/400', // Default image
                          placeholder: (context, url) =>
                              const Center(child: CircularProgressIndicator()),
                          errorWidget: (context, url, error) =>
                              const Center(child: Text('No image found')),
                          fit: BoxFit.contain,
                        ),
                      ),
                      Positioned(
                        bottom: 0,
                        left: 0,
                        right: 0,
                        top: 0,
                        child: Center(
                          child: Container(
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.red, width: 2),
                              color: Colors.black,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.play_arrow_outlined,
                              color: Colors.white,
                              size: 30,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(10),
                  Padding(
                    padding: const EdgeInsets.only(left: 20, right: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const SizedBox(
                              height: 30,
                              width: 40,
                              child: Image(
                                image: AssetImage('asset/netfixicon.png'),
                                fit: BoxFit.fill,
                              ),
                            ),
                            textSample(
                              textdetails: formattedTitle,
                              size: 13,
                              fontw: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ],
                        ),
                        const Gap(10),
                        textSample(
                          textdetails: titleName ?? 'No title',
                          size: 25,
                          fontw: FontWeight.bold,
                          color: Colors.white,
                        ),
                        const Gap(10),
                        Container(
                          width: double.infinity,
                          height: 40,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Icon(Icons.play_arrow),
                              const Gap(4),
                              textSample(
                                textdetails: 'Play',
                                size: 18,
                                fontw: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        const Gap(10),
                        Consumer2<DownloadsProvider, NetfilixProvider>(
                          builder: (context, downloadsProvider,
                              netfilixProvider, child) {
                            final data =
                                netfilixProvider.listOfDataOfNetFlix[index];
                            return GestureDetector(
                              onTap: () {
                                downloadsProvider.addDownloads([data]);
                              },
                              child: Container(
                                width: double.infinity,
                                height: 40,
                                decoration: BoxDecoration(
                                  color: Colors.white.withOpacity(0.3),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.download,
                                      color: Colors.white,
                                    ),
                                    const Gap(4),
                                    textSample(
                                      textdetails: 'Download',
                                      size: 18,
                                      fontw: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                        const Gap(10),
                        Text(
                          about ?? 'No about available',
                          style: const TextStyle(color: Colors.white),
                        ),
                        Row(
                          children: [
                            textSample(
                              textdetails: 'Release date:',
                              size: 15,
                              fontw: FontWeight.normal,
                              color: Colors.white.withOpacity(0.3),
                            ),
                            const Gap(10),
                            textSample(
                              textdetails: releaseDate ?? 'No date found',
                              size: 15,
                              fontw: FontWeight.normal,
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            textSample(
                              textdetails: "Original Language",
                              size: 15,
                              fontw: FontWeight.normal,
                              color: Colors.white.withOpacity(0.3),
                            ),
                            const Gap(10),
                            textSample(
                              textdetails: originalLan ?? 'No data',
                              size: 15,
                              fontw: FontWeight.normal,
                              color: Colors.white.withOpacity(0.3),
                            ),
                          ],
                        ),
                        const Gap(10),
                        newoneRowContainer(),
                        const Gap(10),
                        textSample(
                          textdetails: 'Movies List',
                          size: 20,
                          fontw: FontWeight.bold,
                          color: Colors.white,
                        ),
                        const Gap(15),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Consumer<NetfilixProvider>(
              builder: (context, value, child) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final data = value.listOfDataOfNetFlix[index];
                      return Padding(
                        padding: const EdgeInsets.only(left: 20, right: 20),
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 15),
                                  child: SizedBox(
                                    height: 200,
                                    width: double.infinity,
                                    child: ClipRRect(
                                      borderRadius: BorderRadius.circular(10),
                                      child: CachedNetworkImage(
                                          fit: BoxFit.cover,
                                          imageUrl:
                                              '${value.imagePath}${data.backdrop_path}'),
                                    ),
                                  ),
                                ),
                                const Gap(10),
                                textSample(
                                  textdetails: data.title ?? 'No title',
                                  size: 20,
                                  fontw: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ],
                            ),
                            const Positioned.fill(
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
                    },
                    childCount: value.listOfDataOfNetFlix.length,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  // Define newoneRowContainer if it is missing
  Widget newoneRowContainer() {
    return Row(
      children: [
        // Add custom widgets here
      ],
    );
  }
}
