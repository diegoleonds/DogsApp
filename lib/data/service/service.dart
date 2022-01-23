import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/breed.dart';

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
              subBreeds: (value as List<dynamic>).map((subBreed) => subBreed as String).toList()
          )
        );
      });
      return breeds;
    } else {
      throw Exception('Failed to load breeds');
    }
  }

  static Future<String> getBreedImgUrl(Breed breed) async {
    final response = await http
        .get(Uri.parse('https://dog.ceo/api/breed/${breed.name}/images/random'));

    if (response.statusCode == 200) {
      var map = jsonDecode(response.body);
      return map['message'];
    } else {
      throw Exception('Failed to load breed img url');
    }
  }

  static Future<String> getSubBreedImgUrl(String breed, String subBreed) async {
    final response = await http
        .get(Uri.parse('https://dog.ceo/api/breed/$breed/$subBreed/images/random'));

    if (response.statusCode == 200) {
      var map = jsonDecode(response.body);
      return map['message'];
    } else {
      throw Exception('Failed to load breed img url');
    }
  }
}