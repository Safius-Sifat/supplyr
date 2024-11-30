import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../product/domain/product_model.dart';
import '../data/fake_orders_repository.dart';
import '../domain/order.dart';

part 'user_orders_provider.g.dart';

@riverpod
Stream<List<Order>> userOrders(Ref ref) {
  return ref.watch(ordersRepositoryProvider).watchUserOrders();
}

@riverpod
Stream<List<Order>> matchingUserOrders(Ref ref, ProductID id) {
  return ref.watch(ordersRepositoryProvider).watchUserOrders(productId: id);
}
