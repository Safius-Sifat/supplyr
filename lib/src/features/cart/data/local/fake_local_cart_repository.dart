import 'package:supplyr/src/features/cart/data/local/local_cart_repository.dart';

import '../../../../utils/in_memory_store.dart';
import '../../domain/cart.dart';

class FakeLocalCartRepository implements LocalCartRepository {
  FakeLocalCartRepository({this.addDelay = true});
  final bool addDelay;

  final _cart = InMemoryStore<Cart>(const Cart());

  @override
  Future<Cart> fetchCart() => Future.value(_cart.value);

  @override
  Stream<Cart> watchCart() => _cart.stream;

  @override
  Future<void> setCart(Cart cart) async {
    _cart.value = cart;
  }
}
