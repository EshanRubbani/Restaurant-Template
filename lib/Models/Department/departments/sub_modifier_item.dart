import 'dart:convert';

import 'package:collection/collection.dart';

import 'tax.dart';

class SubModifierItem {
  String? itemNum;
  String? itemName;
  String? itemDescription;
  String? price;
  int? bonusPoints;
  bool? bitIsDeleted;
  int? itemType;
  bool? isModifier;
  dynamic modifierType;
  int? serviceMin;
  int? displayIndex;
  bool? isAllowedZeroPrice;
  String? dcmlStock;
  bool? isTracking;
  String? dcmlLowStockQty;
  bool? bitTax1;
  bool? bitTax2;
  bool? bitTax3;
  List<Tax>? tax;
  List<dynamic>? variablePrices;

  SubModifierItem({
    this.itemNum,
    this.itemName,
    this.itemDescription,
    this.price,
    this.bonusPoints,
    this.bitIsDeleted,
    this.itemType,
    this.isModifier,
    this.modifierType,
    this.serviceMin,
    this.displayIndex,
    this.isAllowedZeroPrice,
    this.dcmlStock,
    this.isTracking,
    this.dcmlLowStockQty,
    this.bitTax1,
    this.bitTax2,
    this.bitTax3,
    this.tax,
    this.variablePrices,
  });

  @override
  String toString() {
    return 'SubModifierItem(itemNum: $itemNum, itemName: $itemName, itemDescription: $itemDescription, price: $price, bonusPoints: $bonusPoints, bitIsDeleted: $bitIsDeleted, itemType: $itemType, isModifier: $isModifier, modifierType: $modifierType, serviceMin: $serviceMin, displayIndex: $displayIndex, isAllowedZeroPrice: $isAllowedZeroPrice, dcmlStock: $dcmlStock, isTracking: $isTracking, dcmlLowStockQty: $dcmlLowStockQty, bitTax1: $bitTax1, bitTax2: $bitTax2, bitTax3: $bitTax3, tax: $tax, variablePrices: $variablePrices)';
  }

  factory SubModifierItem.fromMap(Map<String, dynamic> data) {
    return SubModifierItem(
      itemNum: data['ItemNum'] as String?,
      itemName: data['ItemName'] as String?,
      itemDescription: data['ItemDescription'] as String?,
      price: data['Price'] as String?,
      bonusPoints: data['BonusPoints'] as int?,
      bitIsDeleted: data['bitIsDeleted'] as bool?,
      itemType: data['ItemType'] as int?,
      isModifier: data['IsModifier'] as bool?,
      modifierType: data['ModifierType'] as dynamic,
      serviceMin: data['ServiceMin'] as int?,
      displayIndex: data['DisplayIndex'] as int?,
      isAllowedZeroPrice: data['IsAllowedZeroPrice'] as bool?,
      dcmlStock: data['dcmlStock'] as String?,
      isTracking: data['IsTracking'] as bool?,
      dcmlLowStockQty: data['dcmlLowStockQty'] as String?,
      bitTax1: data['bitTax_1'] as bool?,
      bitTax2: data['bitTax_2'] as bool?,
      bitTax3: data['bitTax_3'] as bool?,
      tax: (data['Tax'] as List<dynamic>?)
          ?.map((e) => Tax.fromMap(e as Map<String, dynamic>))
          .toList(),
      variablePrices: data['variablePrices'] as List<dynamic>?,
    );
  }

  Map<String, dynamic> toMap() => {
        'ItemNum': itemNum,
        'ItemName': itemName,
        'ItemDescription': itemDescription,
        'Price': price,
        'BonusPoints': bonusPoints,
        'bitIsDeleted': bitIsDeleted,
        'ItemType': itemType,
        'IsModifier': isModifier,
        'ModifierType': modifierType,
        'ServiceMin': serviceMin,
        'DisplayIndex': displayIndex,
        'IsAllowedZeroPrice': isAllowedZeroPrice,
        'dcmlStock': dcmlStock,
        'IsTracking': isTracking,
        'dcmlLowStockQty': dcmlLowStockQty,
        'bitTax_1': bitTax1,
        'bitTax_2': bitTax2,
        'bitTax_3': bitTax3,
        'Tax': tax?.map((e) => e.toMap()).toList(),
        'variablePrices': variablePrices,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [SubModifierItem].
  factory SubModifierItem.fromJson(String data) {
    return SubModifierItem.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [SubModifierItem] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! SubModifierItem) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      itemNum.hashCode ^
      itemName.hashCode ^
      itemDescription.hashCode ^
      price.hashCode ^
      bonusPoints.hashCode ^
      bitIsDeleted.hashCode ^
      itemType.hashCode ^
      isModifier.hashCode ^
      modifierType.hashCode ^
      serviceMin.hashCode ^
      displayIndex.hashCode ^
      isAllowedZeroPrice.hashCode ^
      dcmlStock.hashCode ^
      isTracking.hashCode ^
      dcmlLowStockQty.hashCode ^
      bitTax1.hashCode ^
      bitTax2.hashCode ^
      bitTax3.hashCode ^
      tax.hashCode ^
      variablePrices.hashCode;
}
