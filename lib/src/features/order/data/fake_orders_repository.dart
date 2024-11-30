import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/in_memory_store.dart';
import '../../product/domain/product_model.dart';
import '../domain/order.dart';

part 'fake_orders_repository.g.dart';

class FakeOrdersRepository {
  FakeOrdersRepository();

  final _orders = InMemoryStore<List<Order>>([]);

  Stream<List<Order>> watchUserOrders({ProductID? productId}) {
    return _orders.stream.map((ordersData) {
      final ordersList = ordersData;
      ordersList.sort(
        (lhs, rhs) => rhs.orderDate.compareTo(lhs.orderDate),
      );
      if (productId != null) {
        return ordersList
            .where((order) => order.items.keys.contains(productId))
            .toList();
      } else {
        return ordersList;
      }
    });
  }

  Future<void> addOrder(Order order) async {
    final value = _orders.value;
    value.add(order);
    _orders.value = value;
  }
}

@Riverpod(keepAlive: true)
FakeOrdersRepository ordersRepository(Ref ref) {
  return FakeOrdersRepository();
}
