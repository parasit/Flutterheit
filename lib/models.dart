import 'dart:convert';
import 'dart:core';

import 'package:collection/collection.dart';

class Session {
  String id = '';
  String title = '';
  String system = '';
  String master = '';
  DateTime startDate = DateTime.now();
  DateTime endDate = DateTime.now();
  DateTime lastUpdated = DateTime.now();
  double freeSlots = 0.0;
  List<String> players = <String>[];
  List<String> tags = <String>[];

  Session(
    this.id,
    this.title,
    this.system,
    this.master,
    this.freeSlots,
    this.players,
    this.tags,
  );

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'system': system,
      'master': master,
      'freeSlots': freeSlots,
      'players': players,
      'tags': tags,
    };
  }

  Session copyWith({
    String? id,
    String? title,
    String? system,
    String? master,
    double? freeSlots,
    List<String>? players,
    List<String>? tags,
  }) {
    return Session(
      id ?? this.id,
      title ?? this.title,
      system ?? this.system,
      master ?? this.master,
      freeSlots ?? this.freeSlots,
      players ?? this.players,
      tags ?? this.tags,
    );
  }

  factory Session.fromMap(Map<String, dynamic> map) {
    return Session(
      map['id'] ?? '',
      map['title'] ?? '',
      map['system'] ?? '',
      map['master'] ?? '',
      map['freeSlots']?.toDouble() ?? 0.0,
      List<String>.from(map['players']),
      List<String>.from(map['tags']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Session.fromJson(String source) =>
      Session.fromMap(json.decode(source));

  @override
  String toString() {
    return 'Session(id: $id, title: $title, system: $system, master: $master, freeSlots: $freeSlots, players: $players, tags: $tags)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    final listEquals = const DeepCollectionEquality().equals;

    return other is Session &&
        other.id == id &&
        other.title == title &&
        other.system == system &&
        other.master == master &&
        other.freeSlots == freeSlots &&
        listEquals(other.players, players) &&
        listEquals(other.tags, tags);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        title.hashCode ^
        system.hashCode ^
        master.hashCode ^
        freeSlots.hashCode ^
        players.hashCode ^
        tags.hashCode;
  }
}
