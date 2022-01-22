import 'package:dogs_app/data/service/service.dart';
import 'package:dogs_app/data/model/breed.dart';
import 'package:flutter/material.dart';

class BreedDetailsArguments {
  final Breed breed;

  BreedDetailsArguments(this.breed);
}

class BreedDetails extends StatefulWidget {
  final Breed breed;
  const BreedDetails({Key? key, required this.breed}) : super(key: key);
  static const routeName = '/breedDetails';

  @override
  createState() => _BreedDetailsState();

}

class _BreedDetailsState extends State<BreedDetails> {
  late Future<String> futureBreedImgUrl;

  @override
  void initState() {
    super.initState();
    futureBreedImgUrl = Service.getBreedImgUrl(widget.breed);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Breed Details'),
      ),
      body: Center(
        child: FutureBuilder<String>(
          future: futureBreedImgUrl,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Image.network(snapshot.data!);
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return const CircularProgressIndicator();
          },
        ),
      )
    );
  }

}

