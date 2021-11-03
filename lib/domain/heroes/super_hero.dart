import 'dart:convert';

import 'package:flutter/foundation.dart';

// Generated by https://quicktype.io
class SuperHero {
  int id;
  String name;
  String slug;
  Powerstats powerstats;
  Biography biography;
  Appearance appearance;
  Work work;
  Connections connections;
  HeroImages images;

  SuperHero({
    required this.id,
    required this.name,
    required this.slug,
    required this.powerstats,
    required this.biography,
    required this.appearance,
    required this.work,
    required this.connections,
    required this.images,
  });

  SuperHero copyWith({
    int? id,
    String? name,
    String? slug,
    Powerstats? powerstats,
    Biography? biography,
    Appearance? appearance,
    Work? work,
    Connections? connections,
    HeroImages? images,
  }) {
    return SuperHero(
      id: id ?? this.id,
      name: name ?? this.name,
      slug: slug ?? this.slug,
      powerstats: powerstats ?? this.powerstats,
      biography: biography ?? this.biography,
      appearance: appearance ?? this.appearance,
      work: work ?? this.work,
      connections: connections ?? this.connections,
      images: images ?? this.images,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'slug': slug,
      'powerstats': powerstats.toMap(),
      'biography': biography.toMap(),
      'appearance': appearance.toMap(),
      'work': work.toMap(),
      'connections': connections.toMap(),
      'images': images.toMap(),
    };
  }

  factory SuperHero.fromMap(Map<String, dynamic> map) {
    return SuperHero(
      id: map['id'],
      name: map['name'],
      slug: map['slug'],
      powerstats: Powerstats.fromMap(map['powerstats']),
      biography: Biography.fromMap(map['biography']),
      appearance: Appearance.fromMap(map['appearance']),
      work: Work.fromMap(map['work']),
      connections: Connections.fromMap(map['connections']),
      images: HeroImages.fromMap(map['images']),
    );
  }

  String toJson() => json.encode(toMap());

  factory SuperHero.fromJson(String source) =>
      SuperHero.fromMap(json.decode(source));

  @override
  String toString() {
    return 'SuperHero(id: $id, name: $name, slug: $slug, powerstats: $powerstats, biography: $biography, appearance: $appearance, work: $work, connections: $connections, images: $images)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SuperHero &&
      other.id == id &&
      other.name == name &&
      other.slug == slug &&
      other.powerstats == powerstats &&
      other.biography == biography &&
      other.appearance == appearance &&
      other.work == work &&
      other.connections == connections &&
      other.images == images;
  }

  @override
  int get hashCode {
    return id.hashCode ^
      name.hashCode ^
      slug.hashCode ^
      powerstats.hashCode ^
      biography.hashCode ^
      appearance.hashCode ^
      work.hashCode ^
      connections.hashCode ^
      images.hashCode;
  }
}

class Appearance {
  String? gender;
  String? race;
  List<String> height;
  List<String> weight;
  String? eyeColor;
  String? hairColor;

  Appearance({
    required this.gender,
    required this.race,
    required this.height,
    required this.weight,
    required this.eyeColor,
    required this.hairColor,
  });

  Appearance copyWith({
    String? gender,
    String? race,
    List<String>? height,
    List<String>? weight,
    String? eyeColor,
    String? hairColor,
  }) {
    return Appearance(
      gender: gender ?? this.gender,
      race: race ?? this.race,
      height: height ?? this.height,
      weight: weight ?? this.weight,
      eyeColor: eyeColor ?? this.eyeColor,
      hairColor: hairColor ?? this.hairColor,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'gender': gender,
      'race': race,
      'height': height,
      'weight': weight,
      'eyeColor': eyeColor,
      'hairColor': hairColor,
    };
  }

  factory Appearance.fromMap(Map<String, dynamic> map) {
    return Appearance(
      gender: map['gender'] != null ? map['gender'] : null,
      race: map['race'] != null ? map['race'] : null,
      height: List<String>.from(map['height']),
      weight: List<String>.from(map['weight']),
      eyeColor: map['eyeColor'] != null ? map['eyeColor'] : null,
      hairColor: map['hairColor'] != null ? map['hairColor'] : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory Appearance.fromJson(String source) =>
      Appearance.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Appearance(gender: $gender, race: $race, height: $height, weight: $weight, eyeColor: $eyeColor, hairColor: $hairColor)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Appearance &&
        other.gender == gender &&
        other.race == race &&
        listEquals(other.height, height) &&
        listEquals(other.weight, weight) &&
        other.eyeColor == eyeColor &&
        other.hairColor == hairColor;
  }

  @override
  int get hashCode {
    return gender.hashCode ^
        race.hashCode ^
        height.hashCode ^
        weight.hashCode ^
        eyeColor.hashCode ^
        hairColor.hashCode;
  }
}

class Biography {
  String fullName;
  String alterEgos;
  List<String> aliases;
  String placeOfBirth;
  String firstAppearance;
  String publisher;
  String alignment;

  Biography({
    required this.fullName,
    required this.alterEgos,
    required this.aliases,
    required this.placeOfBirth,
    required this.firstAppearance,
    required this.publisher,
    required this.alignment,
  });

  Biography copyWith({
    String? fullName,
    String? alterEgos,
    List<String>? aliases,
    String? placeOfBirth,
    String? firstAppearance,
    String? publisher,
    String? alignment,
  }) {
    return Biography(
      fullName: fullName ?? this.fullName,
      alterEgos: alterEgos ?? this.alterEgos,
      aliases: aliases ?? this.aliases,
      placeOfBirth: placeOfBirth ?? this.placeOfBirth,
      firstAppearance: firstAppearance ?? this.firstAppearance,
      publisher: publisher ?? this.publisher,
      alignment: alignment ?? this.alignment,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'fullName': fullName,
      'alterEgos': alterEgos,
      'aliases': aliases,
      'placeOfBirth': placeOfBirth,
      'firstAppearance': firstAppearance,
      'publisher': publisher,
      'alignment': alignment,
    };
  }

  factory Biography.fromMap(Map<String, dynamic> map) {
    return Biography(
      fullName: map['fullName'],
      alterEgos: map['alterEgos'],
      aliases: List<String>.from(map['aliases']),
      placeOfBirth: map['placeOfBirth'],
      firstAppearance: map['firstAppearance'],
      publisher: map['publisher'],
      alignment: map['alignment'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Biography.fromJson(String source) =>
      Biography.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Biography(fullName: $fullName, alterEgos: $alterEgos, aliases: $aliases, placeOfBirth: $placeOfBirth, firstAppearance: $firstAppearance, publisher: $publisher, alignment: $alignment)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Biography &&
        other.fullName == fullName &&
        other.alterEgos == alterEgos &&
        listEquals(other.aliases, aliases) &&
        other.placeOfBirth == placeOfBirth &&
        other.firstAppearance == firstAppearance &&
        other.publisher == publisher &&
        other.alignment == alignment;
  }

  @override
  int get hashCode {
    return fullName.hashCode ^
        alterEgos.hashCode ^
        aliases.hashCode ^
        placeOfBirth.hashCode ^
        firstAppearance.hashCode ^
        publisher.hashCode ^
        alignment.hashCode;
  }
}

class Connections {
  String groupAffiliation;
  String relatives;

  Connections({
    required this.groupAffiliation,
    required this.relatives,
  });

  Connections copyWith({
    String? groupAffiliation,
    String? relatives,
  }) {
    return Connections(
      groupAffiliation: groupAffiliation ?? this.groupAffiliation,
      relatives: relatives ?? this.relatives,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'groupAffiliation': groupAffiliation,
      'relatives': relatives,
    };
  }

  factory Connections.fromMap(Map<String, dynamic> map) {
    return Connections(
      groupAffiliation: map['groupAffiliation'],
      relatives: map['relatives'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Connections.fromJson(String source) =>
      Connections.fromMap(json.decode(source));

  @override
  String toString() =>
      'Connections(groupAffiliation: $groupAffiliation, relatives: $relatives)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Connections &&
        other.groupAffiliation == groupAffiliation &&
        other.relatives == relatives;
  }

  @override
  int get hashCode => groupAffiliation.hashCode ^ relatives.hashCode;
}

class HeroImages {
  String xs;
  String sm;
  String md;
  String lg;

  HeroImages({
    required this.xs,
    required this.sm,
    required this.md,
    required this.lg,
  });

  HeroImages copyWith({
    String? xs,
    String? sm,
    String? md,
    String? lg,
  }) {
    return HeroImages(
      xs: xs ?? this.xs,
      sm: sm ?? this.sm,
      md: md ?? this.md,
      lg: lg ?? this.lg,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'xs': xs,
      'sm': sm,
      'md': md,
      'lg': lg,
    };
  }

  factory HeroImages.fromMap(Map<String, dynamic> map) {
    return HeroImages(
      xs: map['xs'],
      sm: map['sm'],
      md: map['md'],
      lg: map['lg'],
    );
  }

  String toJson() => json.encode(toMap());

  factory HeroImages.fromJson(String source) => HeroImages.fromMap(json.decode(source));

  @override
  String toString() {
    return 'HeroImages(xs: $xs, sm: $sm, md: $md, lg: $lg)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is HeroImages &&
      other.xs == xs &&
      other.sm == sm &&
      other.md == md &&
      other.lg == lg;
  }

  @override
  int get hashCode {
    return xs.hashCode ^
      sm.hashCode ^
      md.hashCode ^
      lg.hashCode;
  }
}

class Powerstats {
  int intelligence;
  int strength;
  int speed;
  int durability;
  int power;
  int combat;

  Powerstats({
    required this.intelligence,
    required this.strength,
    required this.speed,
    required this.durability,
    required this.power,
    required this.combat,
  });

  Powerstats copyWith({
    int? intelligence,
    int? strength,
    int? speed,
    int? durability,
    int? power,
    int? combat,
  }) {
    return Powerstats(
      intelligence: intelligence ?? this.intelligence,
      strength: strength ?? this.strength,
      speed: speed ?? this.speed,
      durability: durability ?? this.durability,
      power: power ?? this.power,
      combat: combat ?? this.combat,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'intelligence': intelligence,
      'strength': strength,
      'speed': speed,
      'durability': durability,
      'power': power,
      'combat': combat,
    };
  }

  factory Powerstats.fromMap(Map<String, dynamic> map) {
    return Powerstats(
      intelligence: map['intelligence'],
      strength: map['strength'],
      speed: map['speed'],
      durability: map['durability'],
      power: map['power'],
      combat: map['combat'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Powerstats.fromJson(String source) =>
      Powerstats.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Powerstats(intelligence: $intelligence, strength: $strength, speed: $speed, durability: $durability, power: $power, combat: $combat)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Powerstats &&
        other.intelligence == intelligence &&
        other.strength == strength &&
        other.speed == speed &&
        other.durability == durability &&
        other.power == power &&
        other.combat == combat;
  }

  @override
  int get hashCode {
    return intelligence.hashCode ^
        strength.hashCode ^
        speed.hashCode ^
        durability.hashCode ^
        power.hashCode ^
        combat.hashCode;
  }
}

class Work {
  String occupation;
  String base;

  Work({
    required this.occupation,
    required this.base,
  });

  Work copyWith({
    String? occupation,
    String? base,
  }) {
    return Work(
      occupation: occupation ?? this.occupation,
      base: base ?? this.base,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'occupation': occupation,
      'base': base,
    };
  }

  factory Work.fromMap(Map<String, dynamic> map) {
    return Work(
      occupation: map['occupation'],
      base: map['base'],
    );
  }

  String toJson() => json.encode(toMap());

  factory Work.fromJson(String source) => Work.fromMap(json.decode(source));

  @override
  String toString() => 'Work(occupation: $occupation, base: $base)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Work &&
        other.occupation == occupation &&
        other.base == base;
  }

  @override
  int get hashCode => occupation.hashCode ^ base.hashCode;
}
