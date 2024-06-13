import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class TodoModels {
  // final int id;
  final String itemName;
  DateTime createdAt;
  TodoModels({
    required this.itemName,
    required this.createdAt,
  });

  TodoModels copyWith({
    String? itemName,
    DateTime? createdAt,
  }) {
    return TodoModels(
      itemName: itemName ?? this.itemName,
      createdAt: createdAt ?? this.createdAt,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'itemName': itemName,
      'createdAt': createdAt.millisecondsSinceEpoch,
    };
  }

  factory TodoModels.fromMap(Map<String, dynamic> map) {
    return TodoModels(
      itemName: map['itemName'] as String,
      createdAt: DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int),
    );
  }

  String toJson() => json.encode(toMap());

  factory TodoModels.fromJson(String source) =>
      TodoModels.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'TodoModels(itemName: $itemName, createdAt: $createdAt)';

  @override
  bool operator ==(covariant TodoModels other) {
    if (identical(this, other)) return true;

    return other.itemName == itemName && other.createdAt == createdAt;
  }

  @override
  int get hashCode => itemName.hashCode ^ createdAt.hashCode;
}
