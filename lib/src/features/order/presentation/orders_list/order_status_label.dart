import 'package:flutter/material.dart';

import '../../domain/order.dart';

class OrderStatusLabel extends StatelessWidget {
  const OrderStatusLabel({super.key, required this.order});
  final Order order;

  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyLarge!;
    switch (order.orderStatus) {
      case OrderStatus.pending:
        return Text(
          'Pending - preparing for delivery',
          style: textStyle,
        );
      case OrderStatus.shipped:
        return Text(
          'Shipped',
          style: textStyle,
        );
      case OrderStatus.delivered:
        return Text(
          'Delivered',
          style: textStyle.copyWith(color: Colors.green),
        );
    }
  }
}
