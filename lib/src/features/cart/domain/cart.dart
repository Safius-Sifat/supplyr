import 'dart:convert';

import 'package:equatable/equatable.dart';

import '../../product/domain/product_model.dart';
import 'item.dart';

class Cart extends Equatable {
  const Cart([this.items = const {}]);

  final Map<ProductID, int> items;

  factory Cart.fromMap(Map<String, dynamic> map) {
    return Cart(
      Map<ProductID, int>.from(map['items']),
    );
  }

  Map<String, dynamic> toMap() => {
        'items': items,
      };

  factory Cart.fromJson(String source) => Cart.fromMap(json.decode(source));

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [items];

  @override
  bool? get stringify => true;
}

extension CartItems on Cart {
  List<Item> toItemsList() {
    return items.entries.map((entry) {
      return Item(
        productId: entry.key,
        quantity: entry.value,
      );
    }).toList();
  }
}
