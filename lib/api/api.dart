import 'dart:convert';

import 'package:movieapp/constants.dart';
import '../models/movie.dart';
import 'package:http/http.dart' as http;

class Api {
  //constans llathh next class name ann api key one classs
  static const _movie =
      "https://api.themoviedb.org/3/discover/movie?api_key=${Constants.apikey}";
  static const _topRatedUrl =
      "https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apikey}";
  static const _topUpcomingUrl =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apikey}";
  static const _tvEpisodes =
  "https://api.themoviedb.org/3/discover/tv?api_key=${Constants.apikey}";
  static const _popular =
  "https://api.themoviedb.org/3/person/popular?api_key=${Constants.apikey}";

  Future<List<Movie>> getDiscoverMovies() async {
    final response = await http.get(Uri.parse(_movie));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something happend");
    }
  }

  Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(_topRatedUrl));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something happend");
    }
  }

  Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(_topUpcomingUrl));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something happend");
    }
  }

  Future<List<Movie>> getTvEpisodes() async {
    final response = await http.get(Uri.parse(_tvEpisodes));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something happend");
    }
  }

  Future<List<Movie>> getPopular() async {
    final response = await http.get(Uri.parse(_popular));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final decodedData = jsonDecode(response.body)["results"] as List;
      // print(decodedData);
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception("Something happend");
    }
  }
}
