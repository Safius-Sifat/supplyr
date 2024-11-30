import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:supplyr/src/utils/async_value_ui.dart';
import '../../../common_widgets/cart_button.dart';
import '../../../common_widgets/custom_modal_bottom_sheet.dart';
import '../../../common_widgets/network_image_with_loader.dart';
import '../../../constants/constants.dart';
import '../../cart/application/cart_service.dart';
import '../../cart/presentation/add_to_cart/add_to_cart_controller.dart';
import '../../cart/presentation/item_quantity_selector.dart';
import '../domain/product_model.dart';
import 'added_to_cart_message_screen.dart';
import 'components/product_info.dart';
import 'components/unit_price.dart';

class ProductBuyNowScreen extends ConsumerStatefulWidget {
  const ProductBuyNowScreen({super.key, required this.product});
  final Product product;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _ProductBuyNowScreenState();
}

class _ProductBuyNowScreenState extends ConsumerState<ProductBuyNowScreen> {
  @override
  Widget build(BuildContext context) {
    ref.listen<AsyncValue>(
      addToCartControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final availableQuantity =
        ref.watch(itemAvailableQuantityProvider(widget.product));
    final state = ref.watch(addToCartControllerProvider);
    final quantity = ref.watch(itemQuantityControllerProvider);
    return Scaffold(
      bottomNavigationBar: availableQuantity < 1
          ? null
          : CartButton(
              price:
                  (widget.product.priceAfetDiscount ?? widget.product.price) *
                      quantity,
              title: availableQuantity > 0 ? 'Add to Cart' : 'Out of Stock',
              subTitle: "Total price",
              press: () {
                if (availableQuantity > 0) {
                  ref
                      .read(addToCartControllerProvider.notifier)
                      .addItem(widget.product.id);
                  customModalBottomSheet(
                    context,
                    isDismissible: false,
                    child: const AddedToCartMessageScreen(),
                  );
                }
              },
            ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: defaultPadding / 2, vertical: defaultPadding),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const BackButton(),
                  Text(
                    widget.product.title,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: SvgPicture.asset("assets/icons/Bookmark.svg",
                        color: Theme.of(context).textTheme.bodyLarge!.color),
                  ),
                ],
              ),
            ),
            Expanded(
              child: CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: defaultPadding),
                      child: AspectRatio(
                        aspectRatio: 1.05,
                        child: NetworkImageWithLoader(widget.product.imageUrl),
                      ),
                    ),
                  ),
                  ProductInfo(
                    brand: widget.product.brandName,
                    title: widget.product.title,
                    isAvailable: availableQuantity > 0,
                    description: widget.product.description,
                    rating: 4.4,
                    numOfReviews: 126,
                  ),
                  const SliverToBoxAdapter(child: Divider()),
                  SliverPadding(
                    padding: const EdgeInsets.all(defaultPadding),
                    sliver: SliverToBoxAdapter(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            child: UnitPrice(
                              price: widget.product.price,
                              priceAfterDiscount:
                                  widget.product.priceAfetDiscount,
                            ),
                          ),
                          ItemQuantitySelector(
                            quantity: quantity,
                            maxQuantity: min(availableQuantity, 10),
                            onChanged: state.isLoading
                                ? null
                                : (quantity) => ref
                                    .read(
                                        itemQuantityControllerProvider.notifier)
                                    .updateQuantity(quantity),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SliverToBoxAdapter(
                      child: SizedBox(height: defaultPadding))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
