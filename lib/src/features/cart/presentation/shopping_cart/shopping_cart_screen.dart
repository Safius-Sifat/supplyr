import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:supplyr/src/utils/async_value_ui.dart';

import '../../../../common_widgets/async_value_widget.dart';
import '../../../../routing/app_router.dart';
import '../../application/cart_service.dart';
import '../../domain/cart.dart';
import 'shopping_cart_item.dart';
import 'shopping_cart_items_builder.dart';
import 'shopping_cart_screen_controller.dart';

class ShoppingCartScreen extends ConsumerWidget {
  const ShoppingCartScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue<void>>(
      shoppingCartScreenControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(shoppingCartScreenControllerProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Shopping Cart'),
      ),
      body: Consumer(
        builder: (context, ref, child) {
          final cartValue = ref.watch(cartProvider);
          return AsyncValueWidget<Cart>(
            value: cartValue,
            data: (cart) => ShoppingCartItemsBuilder(
              items: cart.toItemsList(),
              itemBuilder: (_, item, index) => ShoppingCartItem(
                item: item,
                itemIndex: index,
              ),
              ctaBuilder: (_) => ElevatedButton(
                  child: const Text('Checkout'),
                  onPressed: () {
                    context.goNamed(AppRoute.checkout.name);
                  }),
            ),
          );
        },
      ),
    );
  }
}
