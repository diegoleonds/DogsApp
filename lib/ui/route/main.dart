import 'package:dogs_app/ui/route/breedDetails.dart';
import 'package:dogs_app/ui/route/breedsList.dart';
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
      title: 'Fetch Data Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: BreedsList.routeName,
      routes: {
        BreedsList.routeName: (context) => BreedsList(),
        BreedDetails.routeName: (context) => BreedDetails()
      },
    );
  }
}

