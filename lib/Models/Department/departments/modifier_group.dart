import 'dart:convert';

import 'package:collection/collection.dart';

import 'sub_modifier_item.dart';

class ModifierGroup {
  String? groupName;
  String? groupNum;
  int? minQty;
  int? maxQty;
  int? itemType;
  bool? isModifier;
  dynamic modifierType;
  bool? bitIsDeleted;
  bool? isOverridePrice;
  int? allowedPortion;
  bool? isHalf;
  bool? isDispalyInMenu;
  dynamic nvarDispalyItemName;
  String? dcmlOnlineItemPrice;
  int? displayIndex;
  int? serviceMin;
  bool? isChargePrice;
  bool? isAllowedZeroPrice;
  bool? isTracking;
  List<SubModifierItem>? subModifierItem;
  List<dynamic>? chosenToppings;
  List<dynamic>? variablePrices;
  dynamic dcmlLowStockQty;

  ModifierGroup({
    this.groupName,
    this.groupNum,
    this.minQty,
    this.maxQty,
    this.itemType,
    this.isModifier,
    this.modifierType,
    this.bitIsDeleted,
    this.isOverridePrice,
    this.allowedPortion,
    this.isHalf,
    this.isDispalyInMenu,
    this.nvarDispalyItemName,
    this.dcmlOnlineItemPrice,
    this.displayIndex,
    this.serviceMin,
    this.isChargePrice,
    this.isAllowedZeroPrice,
    this.isTracking,
    this.subModifierItem,
    this.chosenToppings,
    this.variablePrices,
    this.dcmlLowStockQty,
  });

  @override
  String toString() {
    return 'ModifierGroup(groupName: $groupName, groupNum: $groupNum, minQty: $minQty, maxQty: $maxQty, itemType: $itemType, isModifier: $isModifier, modifierType: $modifierType, bitIsDeleted: $bitIsDeleted, isOverridePrice: $isOverridePrice, allowedPortion: $allowedPortion, isHalf: $isHalf, isDispalyInMenu: $isDispalyInMenu, nvarDispalyItemName: $nvarDispalyItemName, dcmlOnlineItemPrice: $dcmlOnlineItemPrice, displayIndex: $displayIndex, serviceMin: $serviceMin, isChargePrice: $isChargePrice, isAllowedZeroPrice: $isAllowedZeroPrice, isTracking: $isTracking, subModifierItem: $subModifierItem, chosenToppings: $chosenToppings, variablePrices: $variablePrices, dcmlLowStockQty: $dcmlLowStockQty)';
  }

  factory ModifierGroup.fromMap(Map<String, dynamic> data) => ModifierGroup(
        groupName: data['GroupName'] as String?,
        groupNum: data['GroupNum'] as String?,
        minQty: data['MinQty'] as int?,
        maxQty: data['MaxQty'] as int?,
        itemType: data['ItemType'] as int?,
        isModifier: data['IsModifier'] as bool?,
        modifierType: data['ModifierType'] as dynamic,
        bitIsDeleted: data['bitIsDeleted'] as bool?,
        isOverridePrice: data['IsOverridePrice'] as bool?,
        allowedPortion: data['AllowedPortion'] as int?,
        isHalf: data['IsHalf'] as bool?,
        isDispalyInMenu: data['IsDispalyInMenu'] as bool?,
        nvarDispalyItemName: data['nvarDispalyItemName'] as dynamic,
        dcmlOnlineItemPrice: data['dcmlOnlineItemPrice'] as String?,
        displayIndex: data['DisplayIndex'] as int?,
        serviceMin: data['ServiceMin'] as int?,
        isChargePrice: data['IsChargePrice'] as bool?,
        isAllowedZeroPrice: data['IsAllowedZeroPrice'] as bool?,
        isTracking: data['IsTracking'] as bool?,
        subModifierItem: (data['SubModifierItem'] as List<dynamic>?)
            ?.map((e) => SubModifierItem.fromMap(e as Map<String, dynamic>))
            .toList(),
        chosenToppings: data['ChosenToppings'] as List<dynamic>?,
        variablePrices: data['variablePrices'] as List<dynamic>?,
        dcmlLowStockQty: data['dcmlLowStockQty'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'GroupName': groupName,
        'GroupNum': groupNum,
        'MinQty': minQty,
        'MaxQty': maxQty,
        'ItemType': itemType,
        'IsModifier': isModifier,
        'ModifierType': modifierType,
        'bitIsDeleted': bitIsDeleted,
        'IsOverridePrice': isOverridePrice,
        'AllowedPortion': allowedPortion,
        'IsHalf': isHalf,
        'IsDispalyInMenu': isDispalyInMenu,
        'nvarDispalyItemName': nvarDispalyItemName,
        'dcmlOnlineItemPrice': dcmlOnlineItemPrice,
        'DisplayIndex': displayIndex,
        'ServiceMin': serviceMin,
        'IsChargePrice': isChargePrice,
        'IsAllowedZeroPrice': isAllowedZeroPrice,
        'IsTracking': isTracking,
        'SubModifierItem': subModifierItem?.map((e) => e.toMap()).toList(),
        'ChosenToppings': chosenToppings,
        'variablePrices': variablePrices,
        'dcmlLowStockQty': dcmlLowStockQty,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [ModifierGroup].
  factory ModifierGroup.fromJson(String data) {
    return ModifierGroup.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [ModifierGroup] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! ModifierGroup) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      groupName.hashCode ^
      groupNum.hashCode ^
      minQty.hashCode ^
      maxQty.hashCode ^
      itemType.hashCode ^
      isModifier.hashCode ^
      modifierType.hashCode ^
      bitIsDeleted.hashCode ^
      isOverridePrice.hashCode ^
      allowedPortion.hashCode ^
      isHalf.hashCode ^
      isDispalyInMenu.hashCode ^
      nvarDispalyItemName.hashCode ^
      dcmlOnlineItemPrice.hashCode ^
      displayIndex.hashCode ^
      serviceMin.hashCode ^
      isChargePrice.hashCode ^
      isAllowedZeroPrice.hashCode ^
      isTracking.hashCode ^
      subModifierItem.hashCode ^
      chosenToppings.hashCode ^
      variablePrices.hashCode ^
      dcmlLowStockQty.hashCode;
}
