import 'package:dogs_app/data/service/service.dart';
import 'package:dogs_app/data/model/breed.dart';
import 'package:dogs_app/ui/route/subBreedDetails.dart';
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
    var breed = widget.breed;
    return Scaffold(
        appBar: AppBar(
          title: Text(breed.name),
        ),
        body: Center(
          child: FutureBuilder<String>(
            future: futureBreedImgUrl,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView(
                  children: [
                    Image.network(
                      snapshot.data!,
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: breed.subBreeds.length,
                        itemBuilder: (context, index) {
                          return ListTile(
                            title: Text(
                              breed.subBreeds[index],
                            ),
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => SubBreedDetails(
                                        arguments: SubBreedDetailsArguments(
                                            breed.subBreeds[index],
                                            breed.name
                                        )
                                    )
                                ),
                              );
                            },
                          );
                        }),
                  ],
                );
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              return const CircularProgressIndicator();
            },
          ),
        ));
  }
}
