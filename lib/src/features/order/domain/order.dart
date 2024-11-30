import '../../../exception/app_exception.dart';
import '../../product/domain/product_model.dart';

enum OrderStatus { pending, shipped, delivered }

extension OrderStatusString on OrderStatus {
  static OrderStatus fromString(String string) {
    if (string == 'confirmed') return OrderStatus.pending;
    if (string == 'shipped') return OrderStatus.shipped;
    if (string == 'delivered') return OrderStatus.delivered;
    throw ParseOrderFailureException(string);
  }
}

typedef OrderID = String;

class Order {
  const Order({
    required this.id,
    required this.items,
    required this.orderStatus,
    required this.orderDate,
    required this.total,
  });

  /// Unique order ID
  final OrderID id;

  /// List of items in that order
  final Map<ProductID, int> items;
  final OrderStatus orderStatus;
  final DateTime orderDate;
  final double total;
}
