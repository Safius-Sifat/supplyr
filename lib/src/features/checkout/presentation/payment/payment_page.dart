import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

import '../../../../common_widgets/async_value_widget.dart';
import '../../../../routing/app_router.dart';
import '../../../cart/application/cart_service.dart';
import '../../../cart/domain/cart.dart';
import '../../../cart/presentation/shopping_cart/shopping_cart_item.dart';
import '../../../cart/presentation/shopping_cart/shopping_cart_items_builder.dart';
import 'payment_button.dart';

class PaymentPage extends ConsumerWidget {
  const PaymentPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<double>>(cartTotalProvider, (_, cartTotal) {
      if (cartTotal.hasValue) {
        if (cartTotal.value == 0.0) {
          context.goNamed(AppRoute.order.name);
        }
      }
    });
    final cartValue = ref.watch(cartProvider);
    return AsyncValueWidget<Cart>(
      value: cartValue,
      data: (cart) {
        return ShoppingCartItemsBuilder(
          items: cart.toItemsList(),
          itemBuilder: (_, item, index) => ShoppingCartItem(
            item: item,
            itemIndex: index,
            isEditable: false,
          ),
          ctaBuilder: (_) => const PaymentButton(),
        );
      },
    );
  }
}
