import 'dart:convert';
import 'package:http/http.dart' as http;

//models
import 'package:flutter_project/models/serie.dart';

class ApiSerie {
  Future<List<Serie>> fetchSerie(int page) async {
    const apiKey = "a7c4848fcfb89f8bef0757f282d0a463";

    final response = await http.get(Uri.parse(
        'https://api.themoviedb.org/3/tv/popular?api_key=$apiKey&language=it&page=$page'));

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      Iterable list = result['results'];
      return list.map((e) => Serie.fromJson(e)).toList();
    } else {
      throw Exception('failed');
    }
  }
}
