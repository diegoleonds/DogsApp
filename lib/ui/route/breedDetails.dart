import 'package:dogs_app/data/model/breed.dart';
import 'package:flutter/material.dart';

class BreedDetailsArguments {
  final Breed breed;

  BreedDetailsArguments(this.breed);
}

class BreedDetails extends StatelessWidget {
  const BreedDetails({Key? key}) : super(key: key);
  static const routeName = '/breedDetails';

  @override
  Widget build(BuildContext context) {
    final breedArgs = ModalRoute.of(context)!.settings.arguments as BreedDetailsArguments;
    final breed = breedArgs.breed;

    return Scaffold(
      appBar: AppBar(
        title: Text(breed.name),
      ),
    );
    }
}