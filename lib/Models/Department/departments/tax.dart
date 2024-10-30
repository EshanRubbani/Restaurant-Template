import 'dart:convert';

import 'package:collection/collection.dart';

class Tax {
  String? tax1;
  String? tax2;
  String? tax3;

  Tax({this.tax1, this.tax2, this.tax3});

  @override
  String toString() => 'Tax(tax1: $tax1, tax2: $tax2, tax3: $tax3)';

  factory Tax.fromMap(Map<String, dynamic> data) => Tax(
        tax1: data['Tax1'] as String?,
        tax2: data['Tax2'] as String?,
        tax3: data['Tax3'] as String?,
      );

  Map<String, dynamic> toMap() => {
        'Tax1': tax1,
        'Tax2': tax2,
        'Tax3': tax3,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Tax].
  factory Tax.fromJson(String data) {
    return Tax.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Tax] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Tax) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode => tax1.hashCode ^ tax2.hashCode ^ tax3.hashCode;
}
