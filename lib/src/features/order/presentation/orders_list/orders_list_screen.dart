import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../common_widgets/async_value_widget.dart';
import '../../../../common_widgets/responsive_center.dart';
import '../../../../constants/app_sizes.dart';
import '../../application/user_orders_provider.dart';
import '../../domain/order.dart';
import 'order_card.dart';

class OrdersListScreen extends StatelessWidget {
  const OrdersListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Orders'),
      ),
      body: Consumer(builder: (context, ref, _) {
        final userOrdersValue = ref.watch(userOrdersProvider);
        return AsyncValueWidget<List<Order>>(
          value: userOrdersValue,
          data: (orders) => orders.isEmpty
              ? Center(
                  child: Text(
                    'No previous orders',
                    style: Theme.of(context).textTheme.titleLarge,
                    textAlign: TextAlign.center,
                  ),
                )
              : CustomScrollView(
                  slivers: <Widget>[
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) => ResponsiveCenter(
                          padding: const EdgeInsets.all(Sizes.p8),
                          child: OrderCard(
                            order: orders[index],
                          ),
                        ),
                        childCount: orders.length,
                      ),
                    ),
                  ],
                ),
        );
      }),
    );
  }
}
