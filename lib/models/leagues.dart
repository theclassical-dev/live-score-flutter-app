class League {
  int id;
  String name;
  String code;
  String emblem;
  String type;
  League({
    this.id = 0,
    this.name = "",
    this.code = "",
    this.emblem = "",
    this.type = "",
  });

  League copyWith({
    int? id,
    String? name,
    String? code,
    String? emblem,
    String? type,
  }) {
    return League(
      id: id ?? this.id,
      name: name ?? this.name,
      code: code ?? this.code,
      emblem: emblem ?? this.emblem,
      type: type ?? this.type,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'code': code,
      'emblem': emblem,
      'type': type,
    };
  }

  factory League.fromMap(Map<String, dynamic> map) {
    return League(
      id: map['id'] ?? 0,
      name: map['name'] ?? '',
      code: map['code'] ?? '',
      emblem: map['emblem'] ?? '',
      type: map['type'] ?? '',
    );
  }

  @override
  String toString() {
    return 'League(id: $id, name: $name, code: $code, emblem: $emblem, $type)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is League &&
        other.id == id &&
        other.name == name &&
        other.code == code &&
        other.emblem == emblem &&
        other.type == type;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        code.hashCode ^
        emblem.hashCode ^
        type.hashCode;
  }
}
