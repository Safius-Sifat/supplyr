import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supplyr/src/common_widgets/network_image_with_loader.dart';

import '../../../../common_widgets/async_value_widget.dart';
import '../../../../common_widgets/responsive_two_column_layout.dart';
import '../../../../constants/app_sizes.dart';
import '../../../../utils/currency_formatter.dart';
import '../../../product/data/products_repository.dart';
import '../../../product/domain/product_model.dart';
import '../../domain/item.dart';
import '../item_quantity_selector.dart';
import 'shopping_cart_screen_controller.dart';

class ShoppingCartItem extends ConsumerWidget {
  const ShoppingCartItem({
    super.key,
    required this.item,
    required this.itemIndex,
    this.isEditable = true,
  });
  final Item item;
  final int itemIndex;

  final bool isEditable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productValue = ref.watch(productProvider(item.productId));
    return AsyncValueWidget<Product?>(
      value: productValue,
      data: (product) => Padding(
        padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(Sizes.p16),
            child: ShoppingCartItemContents(
              product: product!,
              item: item,
              itemIndex: itemIndex,
              isEditable: isEditable,
            ),
          ),
        ),
      ),
    );
  }
}

class ShoppingCartItemContents extends ConsumerWidget {
  const ShoppingCartItemContents({
    super.key,
    required this.product,
    required this.item,
    required this.itemIndex,
    required this.isEditable,
  });
  final Product product;
  final Item item;
  final int itemIndex;
  final bool isEditable;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final priceFormatted = ref
        .watch(currencyFormatterProvider)
        .format(product.priceAfetDiscount ?? product.price);
    return ResponsiveTwoColumnLayout(
      startFlex: 1,
      endFlex: 2,
      breakpoint: 320,
      startContent: NetworkImageWithLoader(
        fit: BoxFit.cover,
        product.imageUrl,
      ),
      spacing: Sizes.p24,
      endContent: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(product.title, style: Theme.of(context).textTheme.titleLarge),
          gapH12,
          Text(priceFormatted, style: Theme.of(context).textTheme.titleMedium),
          gapH12,
          isEditable
              ? EditOrRemoveItemWidget(
                  product: product,
                  item: item,
                  itemIndex: itemIndex,
                )
              : Padding(
                  padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
                  child: Text(
                    'Quantity: ${item.quantity}',
                  ),
                ),
        ],
      ),
    );
  }
}

class EditOrRemoveItemWidget extends ConsumerWidget {
  const EditOrRemoveItemWidget({
    super.key,
    required this.product,
    required this.item,
    required this.itemIndex,
  });
  final Product product;
  final Item item;
  final int itemIndex;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(shoppingCartScreenControllerProvider);
    return Row(
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        ItemQuantitySelector(
          quantity: item.quantity,
          maxQuantity: min(product.availableQuantity, 10),
          itemIndex: itemIndex,
          onChanged: state.isLoading
              ? null
              : (quantity) => ref
                  .read(shoppingCartScreenControllerProvider.notifier)
                  .updateItemQuantity(item.productId, quantity),
        ),
        IconButton(
          icon: Icon(Icons.delete, color: Colors.red[700]),
          onPressed: state.isLoading
              ? null
              : () => ref
                  .read(shoppingCartScreenControllerProvider.notifier)
                  .removeItemById(item.productId),
        ),
      ],
    );
  }
}
