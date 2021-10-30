import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:heroes_app/domain/heroes/super_hero.dart';

class SuperHeroResponse {
  String response;
  String resultsfor;
  List<SuperHero> results;

  SuperHeroResponse({
    required this.response,
    required this.resultsfor,
    required this.results,
  });

  SuperHeroResponse copyWith({
    String? response,
    String? resultsfor,
    List<SuperHero>? results,
  }) {
    return SuperHeroResponse(
      response: response ?? this.response,
      resultsfor: resultsfor ?? this.resultsfor,
      results: results ?? this.results,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'response': response,
      'results-for': resultsfor,
      'results': results.map((x) => x.toMap()).toList(),
    };
  }

  factory SuperHeroResponse.fromMap(Map<String, dynamic> map) {
    return SuperHeroResponse(
      response: map['response'],
      resultsfor: map['results-for'],
      results: List<SuperHero>.from(
          map['results']?.map((x) => SuperHero.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory SuperHeroResponse.fromJson(String source) =>
      SuperHeroResponse.fromMap(json.decode(source));

  @override
  String toString() =>
      'SuperHeroResponse(response: $response, results-for: $resultsfor, results: $results)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SuperHeroResponse &&
        other.response == response &&
        other.resultsfor == resultsfor &&
        listEquals(other.results, results);
  }

  @override
  int get hashCode =>
      response.hashCode ^ resultsfor.hashCode ^ results.hashCode;
}
