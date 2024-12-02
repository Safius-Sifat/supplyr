import 'dart:math';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:supplyr/src/features/cart/domain/mutable_cart.dart';

import '../../product/data/products_repository.dart';
import '../../product/domain/product_model.dart';
import '../data/local_cart_repository.dart';
import '../domain/cart.dart';
import '../domain/item.dart';

part 'cart_service.g.dart';

class CartService {
  CartService(this.ref);
  final Ref ref;

  LocalCartRepository get localCartRepository =>
      ref.read(localCartRepositoryProvider);

  Future<Cart> _fetchCart() {
    return localCartRepository.fetchCart();
  }

  Future<void> _setCart(Cart cart) async {
    await localCartRepository.setCart(cart);
  }

  Future<void> setItem(Item item) async {
    final cart = await _fetchCart();
    final updated = cart.setItem(item);
    await _setCart(updated);
  }

  Future<void> addItem(Item item) async {
    final cart = await _fetchCart();
    final updated = cart.addItem(item);
    await _setCart(updated);
  }

  Future<void> removeItemById(ProductID productId) async {
    final cart = await _fetchCart();
    final updated = cart.removeItemById(productId);
    await _setCart(updated);
  }
}

@riverpod
CartService cartService(Ref ref) {
  return CartService(ref);
}

@riverpod
Stream<Cart> cart(Ref ref) {
  return ref.watch(localCartRepositoryProvider).watchCart();
}

@riverpod
int cartItemsCount(Ref ref) {
  return ref.watch(cartProvider).maybeMap(
        data: (cart) => cart.value.items.length,
        orElse: () => 0,
      );
}

@riverpod
Future<double> cartTotal(Ref ref) async {
  final cart = await ref.watch(cartProvider.future);
  if (cart.items.isNotEmpty) {
    var total = 0.0;
    for (final item in cart.items.entries) {
      final product = await ref.watch(productProvider(item.key).future);
      if (product != null) {
        total += (product.priceAfetDiscount ?? product.price) * item.value;
      }
    }
    return total;
  } else {
    return 0.0;
  }
}

@riverpod
Future<List<({Product product, int quantity})>> productsInCart(Ref ref) async {
  final cart = await ref.watch(cartProvider.future);
  if (cart.items.isNotEmpty) {
    List<({Product product, int quantity})> products = [];
    for (final item in cart.items.entries) {
      final product = await ref.watch(productProvider(item.key).future);
      if (product != null) {
        products.add((product: product, quantity: item.value));
      }
    }
    return products;
  }
  return [];
}

@riverpod
int itemAvailableQuantity(Ref ref, Product product) {
  final cart = ref.watch(cartProvider).value;
  if (cart != null) {
    // get the current quantity for the given product in the cart
    final quantity = cart.items[product.id] ?? 0;
    // subtract it from the product available quantity
    return max(0, product.availableQuantity - quantity);
  } else {
    return product.availableQuantity;
  }
}
