// import 'dart:io';
import 'dart:math';

import 'package:heroes_app/application/config/app_env.dart';
import 'package:heroes_app/application/http/heroes_response.dart';
import 'package:heroes_app/domain/heroes/super_hero.dart';
// import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

class SuperHeroRepository {
  static SuperHeroRepository? _instance;
  SuperHeroRepository._();
  factory SuperHeroRepository() => _instance ??= SuperHeroRepository._();

  static final _apiUrl = AppEnv().heroesApiUrl;
  static final _apiKey = AppEnv().heroesApiKey;

  static const _randomHeroNames = [
    'super',
    'thanos',
    'evil',
    'black',
    'wonder',
    'mega',
  ];

  Future<SuperHero> getRandomHeroFromApi() async {
    final randomName =
        _randomHeroNames[Random().nextInt(_randomHeroNames.length)];
    final uri = Uri.parse('$_apiUrl/$_apiKey/search/$randomName');
    final response = await http.get(uri);
    if (response.isSuccessful()) {
      final heroesResponse = SuperHeroResponse.fromJson(response.body);
      final heroesList = heroesResponse.results;
      final hero = heroesList[Random().nextInt(heroesList.length)];
      return hero;
    }

    throw Exception('fail to get data on $uri');
  }

  // Get heroes, using dio
  // Future<List<Hero>> getHeroes() async {
  //   final response =
  //       await Dio().get('$_apiUrl/search/name?name=iron&apikey=$_apiKey');
  //   final heroes = response.data['results'] as List<dynamic>;
  //   return heroes.map((hero) => Hero.fromJson(hero)).toList();
  // }

// Find hero by id using https://superheroapi.com
  // Hero findById(id) => Hero(
  //   id: id,
  //   name: 'Hero $id',
  //   description: 'Hero description $id',
  //   imageUrl: 'https://superheroapi.com/api/1021809847003909/image/id/$id',
  // );

}

extension FuckingResponse on Response {
  bool isSuccessful() => statusCode >= 200 && statusCode < 300;
  bool isNotFound() => statusCode == 404;
  bool isUnauthorized() => statusCode == 401;
  bool isClientError() => statusCode >= 400 && statusCode < 500;
  bool isServerError() => statusCode >= 500 && statusCode < 600;
}
