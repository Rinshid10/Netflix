import 'package:flutter/material.dart';
import 'package:netflix/viewModel/netfilixprovider.dart';
import 'package:provider/provider.dart';

class SamplePage extends StatefulWidget {
  const SamplePage({super.key});

  @override
  State<SamplePage> createState() => _SamplePageState();
}

class _SamplePageState extends State<SamplePage> {
  @override
  @override
  void initState() {
    super.initState();
    // Delay the state change until after the build phase
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Provider.of<NetfilixProvider>(context, listen: false).getAllMovieData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<NetfilixProvider>(
        builder: (context, value, child) {
          if (value.flag) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          return ListView.builder(
            itemCount: value.listOfDataOfNetFlix.length,
            itemBuilder: (context, index) {
              var detailsOfNetflix = value.listOfDataOfNetFlix[index];
              return ListTile(
                leading: Image.network('${value.imagePath}'
                    '${detailsOfNetflix.backdrop_path}'),
                title: Text(detailsOfNetflix.title ?? 'No Title'),
              );
            },
          );
        },
      ),
    );
  }
}
