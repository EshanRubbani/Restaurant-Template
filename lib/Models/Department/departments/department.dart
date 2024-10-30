import 'dart:convert';

import 'package:collection/collection.dart';

import 'item.dart';

class Department {
  String? departmentName;
  String? departmentId;
  List<Item>? item;

  Department({this.departmentName, this.departmentId, this.item});

  @override
  String toString() {
    return 'Department(departmentName: $departmentName, departmentId: $departmentId, item: $item)';
  }

  factory Department.fromMap(Map<String, dynamic> data) => Department(
        departmentName: data['DepartmentName'] as String?,
        departmentId: data['DepartmentId'] as String?,
        item: (data['Item'] as List<dynamic>?)
            ?.map((e) => Item.fromMap(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toMap() => {
        'DepartmentName': departmentName,
        'DepartmentId': departmentId,
        'Item': item?.map((e) => e.toMap()).toList(),
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Department].
  factory Department.fromJson(String data) {
    return Department.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Department] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Department) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      departmentName.hashCode ^ departmentId.hashCode ^ item.hashCode;
}
