// To parse this JSON data, do
//
//     final type = typeFromJson(jsonString);

import 'dart:convert';

Type typeFromJson(String str) => Type.fromJson(json.decode(str));

class Type {
    Type({
        this.damageRelations,
        this.gameIndices,
        this.generation,
        this.id,
        this.moveDamageClass,
        this.moves,
        this.name,
        this.names,
        this.pastDamageRelations,
        this.pokemon,
    });

    DamageRelations? damageRelations;
    List<GameIndex>? gameIndices;
    Generation? generation;
    int? id;
    Generation? moveDamageClass;
    List<Generation>? moves;
    String? name;
    List<Name>? names;
    List<PastDamageRelation>? pastDamageRelations;
    List<Pokemon>? pokemon;

    factory Type.fromJson(Map<String, dynamic> json) => Type(
        damageRelations: DamageRelations.fromJson(json["damage_relations"]),
        gameIndices: List<GameIndex>.from(json["game_indices"].map((x) => GameIndex.fromJson(x))),
        generation: Generation.fromJson(json["generation"]),
        id: json["id"],
        moveDamageClass: Generation.fromJson(json["move_damage_class"]),
        moves: List<Generation>.from(json["moves"].map((x) => Generation.fromJson(x))),
        name: json["name"],
        names: List<Name>.from(json["names"].map((x) => Name.fromJson(x))),
        pastDamageRelations: List<PastDamageRelation>.from(json["past_damage_relations"].map((x) => PastDamageRelation.fromJson(x))),
        pokemon: List<Pokemon>.from(json["pokemon"].map((x) => Pokemon.fromJson(x))),
    );

}

class DamageRelations {
    DamageRelations({
        this.doubleDamageFrom,
        this.doubleDamageTo,
        this.halfDamageFrom,
        this.halfDamageTo,
        this.noDamageFrom,
        this.noDamageTo,
    });

    List<Generation>? doubleDamageFrom;
    List<Generation>? doubleDamageTo;
    List<Generation>? halfDamageFrom;
    List<Generation>? halfDamageTo;
    List<Generation>? noDamageFrom;
    List<Generation>? noDamageTo;

    factory DamageRelations.fromJson(Map<String, dynamic> json) => DamageRelations(
        doubleDamageFrom: List<Generation>.from(json["double_damage_from"].map((x) => Generation.fromJson(x))),
        doubleDamageTo: List<Generation>.from(json["double_damage_to"].map((x) => Generation.fromJson(x))),
        halfDamageFrom: List<Generation>.from(json["half_damage_from"].map((x) => Generation.fromJson(x))),
        halfDamageTo: List<Generation>.from(json["half_damage_to"].map((x) => Generation.fromJson(x))),
        noDamageFrom: List<Generation>.from(json["no_damage_from"].map((x) => x)),
        noDamageTo: List<Generation>.from(json["no_damage_to"].map((x) => x)),
    );

}

class Generation {
    Generation({
        this.name,
        this.url,
    });

    String? name;
    String? url;

    factory Generation.fromJson(Map<String, dynamic> json) => Generation(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}

class GameIndex {
    GameIndex({
        this.gameIndex,
        this.generation,
    });

    int? gameIndex;
    Generation? generation;

    factory GameIndex.fromJson(Map<String, dynamic> json) => GameIndex(
        gameIndex: json["game_index"],
        generation: Generation.fromJson(json["generation"]),
    );

}

class Name {
    Name({
        this.language,
        this.name,
    });

    Generation? language;
    String? name;

    factory Name.fromJson(Map<String, dynamic> json) => Name(
        language: Generation.fromJson(json["language"]),
        name: json["name"],
    );

}

class PastDamageRelation {
    PastDamageRelation({
        this.damageRelations,
        this.generation,
    });

    DamageRelations? damageRelations;
    Generation? generation;

    factory PastDamageRelation.fromJson(Map<String, dynamic> json) => PastDamageRelation(
        damageRelations: DamageRelations.fromJson(json["damage_relations"]),
        generation: Generation.fromJson(json["generation"]),
    );

}

class Pokemon {
    Pokemon({
        this.pokemon,
        this.slot,
    });

    Generation? pokemon;
    int? slot;

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        pokemon: Generation.fromJson(json["pokemon"]),
        slot: json["slot"],
    );

}
