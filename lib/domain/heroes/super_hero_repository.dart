import 'dart:convert';
import 'dart:math';

import 'package:heroes_app/application/config/app_env.dart';
import 'package:heroes_app/domain/heroes/super_hero.dart';
import 'package:heroes_app/infra/http_response_utils.dart';
import 'package:http/http.dart' as http;

class SuperHeroRepository {
  static SuperHeroRepository? _instance;
  SuperHeroRepository._();
  factory SuperHeroRepository() => _instance ??= SuperHeroRepository._();

  static final _apiUrl = AppEnv().heroesApiUrl;

  static List<dynamic>? _allHeroesListCache;

  Future<SuperHero> getRandomHeroFromApi() async {
    _allHeroesListCache ??= await _fetchAllHeroes();
    final heroesList = _allHeroesListCache!;
    final hero = heroesList[Random().nextInt(heroesList.length)];
    return SuperHero.fromMap(hero);
  }

  Future<List<dynamic>> _fetchAllHeroes() async {
    final uri = Uri.parse('$_apiUrl/all.json');
    final response = await http.get(uri);
    if (response.isSuccessful()) {
      return (json.decode(response.body) as List<dynamic>);
    }
    throw Exception('fail to fetch heroes data on $uri');
  }
}
