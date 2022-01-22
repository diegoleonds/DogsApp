import 'package:dogs_app/data/model/breed.dart';
import 'package:dogs_app/data/service/service.dart';
import 'package:dogs_app/ui/route/breedDetails.dart';
import 'package:flutter/material.dart';

class BreedsList extends StatefulWidget {
  const BreedsList({Key? key}) : super(key: key);
  static const routeName = '/';

  @override
  createState() => _BreedsListState();
}

class _BreedsListState extends State<BreedsList> {
  late Future<List<Breed>> futureBreeds;

  @override
  void initState() {
    super.initState();
    futureBreeds = Service.getBreeds();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Fetch Data Example'),
      ),
      body: Center(
        child: FutureBuilder<List<Breed>>(
          future: futureBreeds,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    var breed = snapshot.data![index];
                    return ListTile(
                      title: Text(breed.name),
                      onTap: () {
                        Navigator.pushNamed(
                            context,
                            BreedDetails.routeName,
                            arguments: BreedDetailsArguments(breed)
                        );
                      },
                    );
                  });
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }

            // By default, show a loading spinner.
            return const CircularProgressIndicator();
          },
        ),
      ),
    );
  }

}