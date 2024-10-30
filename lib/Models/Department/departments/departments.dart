import 'dart:convert';

import 'package:collection/collection.dart';

import 'department.dart';

class Departments {
  List<Department>? department;
  List<dynamic>? pizzaDepartment;

  Departments({this.department, this.pizzaDepartment});

  @override
  String toString() {
    return 'Departments(department: $department, pizzaDepartment: $pizzaDepartment)';
  }

  factory Departments.fromMap(Map<String, dynamic> data) => Departments(
        department: (data['Department'] as List<dynamic>?)
            ?.map((e) => Department.fromMap(e as Map<String, dynamic>))
            .toList(),
        pizzaDepartment: data['PizzaDepartment'] as List<dynamic>?,
      );

  Map<String, dynamic> toMap() => {
        'Department': department?.map((e) => e.toMap()).toList(),
        'PizzaDepartment': pizzaDepartment,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Departments].
  factory Departments.fromJson(String data) {
    return Departments.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Departments] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Departments) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => department.hashCode ^ pizzaDepartment.hashCode;
}
