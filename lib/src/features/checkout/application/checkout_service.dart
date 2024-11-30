import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/current_date_provider.dart';
import '../../cart/data/local/local_cart_repository.dart';
import '../../cart/domain/cart.dart';
import '../../order/data/fake_orders_repository.dart';
import '../../order/domain/order.dart';
import '../../product/data/products_repository.dart';

part 'checkout_service.g.dart';

class CheckoutService {
  CheckoutService(this.ref);
  final Ref ref;

  Future<void> placeOrder() async {
    final localCartRepository = ref.read(localCartRepositoryProvider);
    final ordersRepository = ref.read(ordersRepositoryProvider);
    final currentDateBuilder = ref.read(currentDateBuilderProvider);
    final cart = await localCartRepository.fetchCart();
    if (cart.items.isNotEmpty) {
      final total = _totalPrice(cart);
      final orderDate = currentDateBuilder();
      final orderId = orderDate.toIso8601String();
      final order = Order(
        id: orderId,
        items: cart.items,
        orderStatus: OrderStatus.pending,
        orderDate: orderDate,
        total: total,
      );
      await ordersRepository.addOrder(order);
      await localCartRepository.setCart(const Cart());
    } else {
      throw StateError('Can\'t place an order if the cart is empty');
    }
  }

  double _totalPrice(Cart cart) {
    if (cart.items.isEmpty) {
      return 0.0;
    }
    final producsRepository = ref.read(productsRepositoryProvider);
    return cart.items.entries
        .map((entry) =>
            entry.value * // quantity
            (producsRepository.getProduct(entry.key)!.priceAfetDiscount ??
                producsRepository.getProduct(entry.key)!.price)) // price
        .reduce((value, element) => value + element);
  }
}

@riverpod
CheckoutService checkoutService(Ref ref) {
  return CheckoutService(ref);
}
