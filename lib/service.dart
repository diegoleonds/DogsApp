import 'dart:convert';

import 'package:http/http.dart' as http;

import 'breed.dart';

class Service {
  static Future<List<Breed>> getBreeds() async {
    final response = await http
        .get(Uri.parse('https://dog.ceo/api/breeds/list/all'));

    if (response.statusCode == 200) {
      var map = jsonDecode(response.body);
      Map<String, dynamic> message = map["message"];

      List<Breed> breeds = [];
      message.forEach((key, value) {
        breeds.add(
          Breed(
              name: key,
              subBreeds: (value as List<dynamic>).map((breed) => breed as String).toList()
          )
        );
      });
      return breeds;
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }
}