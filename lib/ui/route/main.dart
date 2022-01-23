import 'package:dogs_app/data/model/breed.dart';
import 'package:dogs_app/ui/route/breedDetails.dart';
import 'package:dogs_app/ui/route/breedsList.dart';
import 'package:dogs_app/ui/route/subBreedDetails.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Breeds',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: BreedsList.routeName,
      onGenerateRoute: (settings) {
        final arguments = settings.arguments;
        late WidgetBuilder builder;

        switch (settings.name) {
          case BreedsList.routeName:
            builder = (BuildContext _) => const BreedsList();
            break;
          case BreedDetails.routeName:
            if (arguments is Breed) {
              builder = (BuildContext _) => BreedDetails(breed: arguments);
            }
            break;
          case SubBreedDetails.routeName:
            if (arguments is SubBreedDetailsArguments) {
              builder = (BuildContext _) => SubBreedDetails(arguments: arguments,);
            }
            break;
        }
        return MaterialPageRoute(
          builder: builder,
          settings: settings
        );
      },
    );
  }
}

