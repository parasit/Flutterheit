import 'dart:convert';

import 'package:flutter/services.dart';

List<Player> modelUserFromJson(String str) =>
    List<Player>.from(json.decode(str).map((x) => Player.fromJson(x)));

class Player {
  String name;
  String class_;
  String STR;
  Player({
    required this.name,
    required this.class_,
    required this.STR,
  });

  // String toJson() => json.encode(toMap());

  factory Player.fromJson(Map<String, dynamic> json) => Player(
        name: json["name"],
        class_: json["class"],
        STR: json["STR"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "class": class_,
        "STR": STR,
      };

  @override
  String toString() => 'Player(name: $name, class_: $class_, STR: $STR)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Player &&
        other.name == name &&
        other.class_ == class_ &&
        other.STR == STR;
  }

  @override
  int get hashCode => name.hashCode ^ class_.hashCode ^ STR.hashCode;
}

List<Player> company = [];

Future<List<Player>> loadPlayers() async {
  // Player testMonster;

  final String response = await rootBundle.loadString('assets/players.json');
  List<dynamic> list = await json.decode(response);

  var myCompany = list.map((e) => Player.fromJson(e)).toList();
  // testMonster = company[0];
  // print(testMonster.name);
  return myCompany;
}
