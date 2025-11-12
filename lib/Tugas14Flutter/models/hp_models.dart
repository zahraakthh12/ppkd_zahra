// To parse this JSON data, do
//
//     final characterModel = characterModelFromJson(jsonString);

import 'dart:convert';

List<CharacterModel> characterModelFromJson(String str) => List<CharacterModel>.from(json.decode(str).map((x) => CharacterModel.fromJson(x)));

String characterModelToJson(List<CharacterModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class CharacterModel {
    String? id;
    String? name;
    List<String>? alternateNames;
    String? species;
    String? gender;
    String? house;
    String? dateOfBirth;
    int? yearOfBirth;
    bool? wizard;
    String? ancestry;
    String? eyeColour;
    String? hairColour;
    Wand? wand;
    String? patronus;
    bool? hogwartsStudent;
    bool? hogwartsStaff;
    String? actor;
    List<String>? alternateActors;
    bool? alive;
    String? image;

    CharacterModel({
        this.id,
        this.name,
        this.alternateNames,
        this.species,
        this.gender,
        this.house,
        this.dateOfBirth,
        this.yearOfBirth,
        this.wizard,
        this.ancestry,
        this.eyeColour,
        this.hairColour,
        this.wand,
        this.patronus,
        this.hogwartsStudent,
        this.hogwartsStaff,
        this.actor,
        this.alternateActors,
        this.alive,
        this.image,
    });

    factory CharacterModel.fromJson(Map<String, dynamic> json) => CharacterModel(
        id: json["id"],
        name: json["name"],
        alternateNames: json["alternate_names"] == null ? [] : List<String>.from(json["alternate_names"]!.map((x) => x)),
        species: json["species"],
        gender: json["gender"],
        house: json["house"],
        dateOfBirth: json["dateOfBirth"],
        yearOfBirth: json["yearOfBirth"],
        wizard: json["wizard"],
        ancestry: json["ancestry"],
        eyeColour: json["eyeColour"],
        hairColour: json["hairColour"],
        wand: json["wand"] == null ? null : Wand.fromJson(json["wand"]),
        patronus: json["patronus"],
        hogwartsStudent: json["hogwartsStudent"],
        hogwartsStaff: json["hogwartsStaff"],
        actor: json["actor"],
        alternateActors: json["alternate_actors"] == null ? [] : List<String>.from(json["alternate_actors"]!.map((x) => x)),
        alive: json["alive"],
        image: json["image"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "alternate_names": alternateNames == null ? [] : List<dynamic>.from(alternateNames!.map((x) => x)),
        "species": species,
        "gender": gender,
        "house": house,
        "dateOfBirth": dateOfBirth,
        "yearOfBirth": yearOfBirth,
        "wizard": wizard,
        "ancestry": ancestry,
        "eyeColour": eyeColour,
        "hairColour": hairColour,
        "wand": wand?.toJson(),
        "patronus": patronus,
        "hogwartsStudent": hogwartsStudent,
        "hogwartsStaff": hogwartsStaff,
        "actor": actor,
        "alternate_actors": alternateActors == null ? [] : List<dynamic>.from(alternateActors!.map((x) => x)),
        "alive": alive,
        "image": image,
    };
}

class Wand {
    String? wood;
    String? core;
    double? length;

    Wand({
        this.wood,
        this.core,
        this.length,
    });

    factory Wand.fromJson(Map<String, dynamic> json) => Wand(
        wood: json["wood"],
        core: json["core"],
        length: json["length"]?.toDouble(),
    );

    Map<String, dynamic> toJson() => {
        "wood": wood,
        "core": core,
        "length": length,
    };
}
