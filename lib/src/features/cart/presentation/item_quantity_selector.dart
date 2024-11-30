import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../constants/constants.dart';

/// Item quantity selector with +/- buttons and a text value in the middle
class ItemQuantitySelector extends StatelessWidget {
  const ItemQuantitySelector({
    super.key,
    required this.quantity,
    this.maxQuantity = 10,
    this.itemIndex,
    this.onChanged,
  });
  final int quantity;
  final int maxQuantity;
  final int? itemIndex;
  final ValueChanged<int>? onChanged;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          "Quantity",
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: defaultPadding),
        Row(
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: OutlinedButton(
                onPressed: onChanged != null && quantity > 1
                    ? () => onChanged!.call(quantity - 1)
                    : null,
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(defaultPadding / 2)),
                child: SvgPicture.asset(
                  "assets/icons/Minus.svg",
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
            SizedBox(
              width: 30.0,
              child: Center(
                child: Text(
                  '$quantity',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ),
            SizedBox(
              height: 40,
              width: 40,
              child: OutlinedButton(
                onPressed: onChanged != null && quantity < maxQuantity
                    ? () => onChanged!.call(quantity + 1)
                    : null,
                style: OutlinedButton.styleFrom(
                    padding: const EdgeInsets.all(defaultPadding / 2)),
                child: SvgPicture.asset(
                  "assets/icons/Plus1.svg",
                  color: Theme.of(context).iconTheme.color,
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
