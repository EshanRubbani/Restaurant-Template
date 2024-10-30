import 'dart:convert';

import 'package:collection/collection.dart';

import 'modifier_group.dart';
import 'tax.dart';

class Item {
  String? name;
  String? id;
  String? itemDescription;
  String? price;
  int? itemType;
  bool? isModifier;
  dynamic modifierType;
  List<ModifierGroup>? modifierGroup;
  List<dynamic>? modifierItem;
  List<dynamic>? subItem;
  List<dynamic>? comboItem;
  List<Tax>? tax;
  int? bonusPoints;
  String? dcmlStock;
  bool? bitIsDeleted;
  bool? isDispalyInMenu;
  String? nvarDispalyItemName;
  String? dcmlOnlineItemPrice;
  int? displayIndex;
  String? brandId;
  int? serviceMin;
  bool? isAllowedZeroPrice;
  bool? isTracking;
  List<dynamic>? chosenToppings;
  dynamic dcmlLowStockQty;

  Item({
    this.name,
    this.id,
    this.itemDescription,
    this.price,
    this.itemType,
    this.isModifier,
    this.modifierType,
    this.modifierGroup,
    this.modifierItem,
    this.subItem,
    this.comboItem,
    this.tax,
    this.bonusPoints,
    this.dcmlStock,
    this.bitIsDeleted,
    this.isDispalyInMenu,
    this.nvarDispalyItemName,
    this.dcmlOnlineItemPrice,
    this.displayIndex,
    this.brandId,
    this.serviceMin,
    this.isAllowedZeroPrice,
    this.isTracking,
    this.chosenToppings,
    this.dcmlLowStockQty,
  });

  @override
  String toString() {
    return 'Item(name: $name, id: $id, itemDescription: $itemDescription, price: $price, itemType: $itemType, isModifier: $isModifier, modifierType: $modifierType, modifierGroup: $modifierGroup, modifierItem: $modifierItem, subItem: $subItem, comboItem: $comboItem, tax: $tax, bonusPoints: $bonusPoints, dcmlStock: $dcmlStock, bitIsDeleted: $bitIsDeleted, isDispalyInMenu: $isDispalyInMenu, nvarDispalyItemName: $nvarDispalyItemName, dcmlOnlineItemPrice: $dcmlOnlineItemPrice, displayIndex: $displayIndex, brandId: $brandId, serviceMin: $serviceMin, isAllowedZeroPrice: $isAllowedZeroPrice, isTracking: $isTracking, chosenToppings: $chosenToppings, dcmlLowStockQty: $dcmlLowStockQty)';
  }

  factory Item.fromMap(Map<String, dynamic> data) => Item(
        name: data['Name'] as String?,
        id: data['Id'] as String?,
        itemDescription: data['ItemDescription'] as String?,
        price: data['Price'] as String?,
        itemType: data['ItemType'] as int?,
        isModifier: data['IsModifier'] as bool?,
        modifierType: data['ModifierType'] as dynamic,
        modifierGroup: (data['ModifierGroup'] as List<dynamic>?)
            ?.map((e) => ModifierGroup.fromMap(e as Map<String, dynamic>))
            .toList(),
        modifierItem: data['ModifierItem'] as List<dynamic>?,
        subItem: data['SubItem'] as List<dynamic>?,
        comboItem: data['ComboItem'] as List<dynamic>?,
        tax: (data['Tax'] as List<dynamic>?)
            ?.map((e) => Tax.fromMap(e as Map<String, dynamic>))
            .toList(),
        bonusPoints: data['BonusPoints'] as int?,
        dcmlStock: data['dcmlStock'] as String?,
        bitIsDeleted: data['bitIsDeleted'] as bool?,
        isDispalyInMenu: data['IsDispalyInMenu'] as bool?,
        nvarDispalyItemName: data['nvarDispalyItemName'] as String?,
        dcmlOnlineItemPrice: data['dcmlOnlineItemPrice'] as String?,
        displayIndex: data['DisplayIndex'] as int?,
        brandId: data['BrandID'] as String?,
        serviceMin: data['ServiceMin'] as int?,
        isAllowedZeroPrice: data['IsAllowedZeroPrice'] as bool?,
        isTracking: data['IsTracking'] as bool?,
        chosenToppings: data['ChosenToppings'] as List<dynamic>?,
        dcmlLowStockQty: data['dcmlLowStockQty'] as dynamic,
      );

  Map<String, dynamic> toMap() => {
        'Name': name,
        'Id': id,
        'ItemDescription': itemDescription,
        'Price': price,
        'ItemType': itemType,
        'IsModifier': isModifier,
        'ModifierType': modifierType,
        'ModifierGroup': modifierGroup?.map((e) => e.toMap()).toList(),
        'ModifierItem': modifierItem,
        'SubItem': subItem,
        'ComboItem': comboItem,
        'Tax': tax?.map((e) => e.toMap()).toList(),
        'BonusPoints': bonusPoints,
        'dcmlStock': dcmlStock,
        'bitIsDeleted': bitIsDeleted,
        'IsDispalyInMenu': isDispalyInMenu,
        'nvarDispalyItemName': nvarDispalyItemName,
        'dcmlOnlineItemPrice': dcmlOnlineItemPrice,
        'DisplayIndex': displayIndex,
        'BrandID': brandId,
        'ServiceMin': serviceMin,
        'IsAllowedZeroPrice': isAllowedZeroPrice,
        'IsTracking': isTracking,
        'ChosenToppings': chosenToppings,
        'dcmlLowStockQty': dcmlLowStockQty,
      };

  /// `dart:convert`
  ///
  /// Parses the string and returns the resulting Json object as [Item].
  factory Item.fromJson(String data) {
    return Item.fromMap(json.decode(data) as Map<String, dynamic>);
  }

  /// `dart:convert`
  ///
  /// Converts [Item] to a JSON string.
  String toJson() => json.encode(toMap());

  @override
  bool operator ==(Object other) {
    if (identical(other, this)) return true;
    if (other is! Item) return false;
    final mapEquals = const DeepCollectionEquality().equals;
    return mapEquals(other.toMap(), toMap());
  }

  @override
  int get hashCode =>
      name.hashCode ^
      id.hashCode ^
      itemDescription.hashCode ^
      price.hashCode ^
      itemType.hashCode ^
      isModifier.hashCode ^
      modifierType.hashCode ^
      modifierGroup.hashCode ^
      modifierItem.hashCode ^
      subItem.hashCode ^
      comboItem.hashCode ^
      tax.hashCode ^
      bonusPoints.hashCode ^
      dcmlStock.hashCode ^
      bitIsDeleted.hashCode ^
      isDispalyInMenu.hashCode ^
      nvarDispalyItemName.hashCode ^
      dcmlOnlineItemPrice.hashCode ^
      displayIndex.hashCode ^
      brandId.hashCode ^
      serviceMin.hashCode ^
      isAllowedZeroPrice.hashCode ^
      isTracking.hashCode ^
      chosenToppings.hashCode ^
      dcmlLowStockQty.hashCode;
}
