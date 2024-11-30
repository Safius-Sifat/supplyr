import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/async_value_widget.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../utils/currency_formatter.dart';
import '../../application/cart_service.dart';

/// Text widget for showing the total price of the cart
class CartTotalText extends ConsumerWidget {
  const CartTotalText({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final cartTotalAsync = ref.watch(cartTotalProvider);
    return ConstrainedBox(
      constraints: const BoxConstraints(minHeight: Sizes.p40),
      child: AsyncValueWidget<double>(
        value: cartTotalAsync,
        data: (double cartTotal) {
          final totalFormatted =
              ref.watch(currencyFormatterProvider).format(cartTotal);
          return Text(
            'Total: $totalFormatted',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          );
        },
      ),
    );
  }
}
