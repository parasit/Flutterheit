import 'dart:convert';

class Player {
  final String name;
  final String class_;
  final String STR;
  Player({
    required this.name,
    required this.class_,
    required this.STR,
  });

  Player copyWith({
    String? name,
    String? class_,
    String? STR,
  }) {
    return Player(
      name: name ?? this.name,
      class_: class_ ?? this.class_,
      STR: STR ?? this.STR,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'class': class_,
      'STR': STR,
    };
  }

  factory Player.fromMap(Map<String, dynamic> map) {
    return Player(
      name: map['name'] ?? '',
      class_: map['class'] ?? '',
      STR: map['STR'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory Player.fromJson(String source) => Player.fromMap(json.decode(source));

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