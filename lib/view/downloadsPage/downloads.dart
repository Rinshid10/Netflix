import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:netflix/utils/utils.dart';
import 'package:netflix/view/widgets/widgets.dart';
import 'package:netflix/viewModel/netfilixprovider.dart';
import 'package:provider/provider.dart';

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
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
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
                    const Icon(
                      Icons.info,
                      color: Colors.white,
                    ),
                    const Gap(10),
                    textSample(
                        textdetails: 'Smart Downloads',
                        size: 15,
                        fontw: FontWeight.bold,
                        color: Colors.white),
                    const Gap(10),
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
              decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Search',
                  prefixIcon: Icon(
                    Icons.search,
                    size: 20,
                  )),
            ),
            const Gap(10),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: 10,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.all(3),
                    child: Card(
                        elevation: 3,
                        color: Utils.main,
                        child: continerInDownload(context, index)),
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

Widget continerInDownload(BuildContext context, int index) {
  return Consumer<NetfilixProvider>(
    builder: (context, value, child) {
      if (index >= value.toprated.length) {
        return const SizedBox(
          height: 100,
          child: Center(
            child: Text(
              'No data available',
              style: TextStyle(color: Colors.white),
            ),
          ),
        );
      }

      final data = value.toprated[index];
      final imageUrl = data.backdrop_path != null
          ? 'https://image.tmdb.org/t/p/w500${data.backdrop_path}'
          : '';

      return SizedBox(
        height: 100,
        width: double.infinity,
        child: Row(
          children: [
            SizedBox(
              height: double.infinity,
              width: 150,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(3),
                child: CachedNetworkImage(
                  imageUrl: imageUrl,
                  placeholder: (context, url) =>
                      const Center(child: CircularProgressIndicator()),
                  errorWidget: (context, url, error) =>
                      const Icon(Icons.error, color: Colors.red),
                  fit: BoxFit.fill,
                ),
              ),
            ),
            const Gap(10),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    data.title ?? 'No title',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.normal,
                      color: Colors.white,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Text(
                    'Downloading...',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.white60,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            const Spacer(),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Icon(
                Icons.keyboard_arrow_right,
                color: Colors.white60,
                size: 40,
              ),
            )
          ],
        ),
      );
    },
  );
}
