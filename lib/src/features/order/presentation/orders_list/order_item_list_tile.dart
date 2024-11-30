import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supplyr/src/common_widgets/network_image_with_loader.dart';

import '../../../../common_widgets/async_value_widget.dart';
import '../../../../constants/app_sizes.dart';
import '../../../cart/domain/item.dart';
import '../../../product/data/products_repository.dart';
import '../../../product/domain/product_model.dart';

class OrderItemListTile extends ConsumerWidget {
  const OrderItemListTile({super.key, required this.item});
  final Item item;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final productValue = ref.watch(productProvider(item.productId));
    return AsyncValueWidget<Product?>(
        value: productValue,
        data: (product) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: Sizes.p8),
            child: Row(
              children: [
                const SizedBox(width: 12),
                SizedBox(
                  height: 70,
                  width: 60,
                  child: NetworkImageWithLoader(
                    product!.imageUrl,
                    radius: 4,
                  ),
                ),
                gapW8,
                Flexible(
                  flex: 3,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(product.title),
                      gapH12,
                      Text(
                        'Quantity: ${item.quantity}',
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        });
  }
}
