import 'dart:convert';

import 'package:flutter/services.dart';

List<Monster> modelUserFromJson(String str) =>
    List<Monster>.from(json.decode(str).map((x) => Monster.fromJson(x)));

class Monster {
  final String name;
  final String meta;
  final String armorClass;
  final String hitPoints;
  final String speed;
  final String str;
  final String str_mod;
  final String dex;
  final String dex_mod;
  final String con;
  final String con_mod;
  final String inteligence;
  final String inteligence_mod;
  final String wis;
  final String wis_mod;
  final String cha;
  final String cha_mod;
  final String savingThrows;
  final String skills;
  final String senses;
  final String languages;
  final String challenge;
  final String traits;
  final String actions;
  final String legendaryActions;
  final String img_url;
  Monster({
    required this.name,
    required this.meta,
    required this.armorClass,
    required this.hitPoints,
    required this.speed,
    required this.str,
    required this.str_mod,
    required this.dex,
    required this.dex_mod,
    required this.con,
    required this.con_mod,
    required this.inteligence,
    required this.inteligence_mod,
    required this.wis,
    required this.wis_mod,
    required this.cha,
    required this.cha_mod,
    required this.savingThrows,
    required this.skills,
    required this.senses,
    required this.languages,
    required this.challenge,
    required this.traits,
    required this.actions,
    required this.legendaryActions,
    required this.img_url,
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'meta': meta,
        'Armor Class': armorClass,
        'Hit Points': hitPoints,
        'Speed': speed,
        'STR': str,
        'STR_mod': str_mod,
        'DEX': dex,
        'DEX_mod': dex_mod,
        'CON': con,
        'CON_mod': con_mod,
        'INT': int,
        'INT_mod': inteligence_mod,
        'WIS': wis,
        'WIS_mod': wis_mod,
        'CHA': cha,
        'CHA_mod': cha_mod,
        'SavingThrows': savingThrows,
        'Skills': skills,
        'Senses': senses,
        'Languages': languages,
        'Challenge': challenge,
        'Traits': traits,
        'Actions': actions,
        'LegendaryActions': legendaryActions,
        'img_url': img_url,
      };

  factory Monster.fromJson(Map<String, dynamic> json) => Monster(
        name: json["name"] ?? '',
        meta: json["meta"] ?? '',
        armorClass: json["Armor Class"] ?? '',
        hitPoints: json["Hit Points"] ?? '',
        speed: json["Speed"] ?? '',
        str: json["STR"] ?? '',
        str_mod: json["STR_mod"] ?? '',
        dex: json["DEX"] ?? '',
        dex_mod: json["DEX_mod"] ?? '',
        con: json["CON"] ?? '',
        con_mod: json["CON_mod"] ?? '',
        inteligence: json["INT"] ?? '',
        inteligence_mod: json["INT_mod"] ?? '',
        wis: json["WIS"] ?? '',
        wis_mod: json["WIS_mod"] ?? '',
        cha: json["CHA"] ?? '',
        cha_mod: json["CHA_mod"] ?? '',
        savingThrows: json["SavingThrows"] ?? '',
        skills: json["Skills"] ?? '',
        senses: json["Senses"] ?? '',
        languages: json["Languages"] ?? '',
        challenge: json["Challenge"] ?? '',
        traits: json["Traits"] ?? '',
        actions: json["Actions"] ?? '',
        legendaryActions: json["LegendaryActions"] ?? '',
        img_url: json["img_url"] ?? '',
      );

  @override
  String toString() {
    return 'Monster(name: $name, meta: $meta, Armor Class: $armorClass, Hit Points: $hitPoints, Speed: $speed, STR: $str, STR_mod: $str_mod, DEX: $dex, DEX_mod: $dex_mod, CON: $con, CON_mod: $con_mod, INT: $int, INT_mod: $inteligence_mod, WIS: $wis, WIS_mod: $wis_mod, CHA: $cha, CHA_mod: $cha_mod, SavingThrows: $savingThrows, Skills: $skills, Senses: $senses, Languages: $languages, Challenge: $challenge, Traits: $traits, Actions: $actions, LegendaryActions: $legendaryActions, img_url: $img_url)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Monster &&
        other.name == name &&
        other.meta == meta &&
        other.armorClass == armorClass &&
        other.hitPoints == hitPoints &&
        other.speed == speed &&
        other.str == str &&
        other.str_mod == str_mod &&
        other.dex == dex &&
        other.dex_mod == dex_mod &&
        other.con == con &&
        other.con_mod == con_mod &&
        other.inteligence == inteligence &&
        other.inteligence_mod == inteligence_mod &&
        other.wis == wis &&
        other.wis_mod == wis_mod &&
        other.cha == cha &&
        other.cha_mod == cha_mod &&
        other.savingThrows == savingThrows &&
        other.skills == skills &&
        other.senses == senses &&
        other.languages == languages &&
        other.challenge == challenge &&
        other.traits == traits &&
        other.actions == actions &&
        other.legendaryActions == legendaryActions &&
        other.img_url == img_url;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        meta.hashCode ^
        armorClass.hashCode ^
        hitPoints.hashCode ^
        speed.hashCode ^
        str.hashCode ^
        str_mod.hashCode ^
        dex.hashCode ^
        dex_mod.hashCode ^
        con.hashCode ^
        con_mod.hashCode ^
        inteligence.hashCode ^
        inteligence_mod.hashCode ^
        wis.hashCode ^
        wis_mod.hashCode ^
        cha.hashCode ^
        cha_mod.hashCode ^
        savingThrows.hashCode ^
        skills.hashCode ^
        senses.hashCode ^
        languages.hashCode ^
        challenge.hashCode ^
        traits.hashCode ^
        actions.hashCode ^
        legendaryActions.hashCode ^
        img_url.hashCode;
  }
}

// List<Monster> bestiary = [];

// Fetch content from the json file
Future<List<Monster>> loadBestiary() async {
  final String response = await rootBundle.loadString('assets/monsters.json');
  List<dynamic> list = await json.decode(response);

  var myBestiary = list.map((e) => Monster.fromJson(e)).toList();
  return myBestiary;
}
