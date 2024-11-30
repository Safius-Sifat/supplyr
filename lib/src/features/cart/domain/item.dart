import 'package:equatable/equatable.dart';

import '../../product/domain/product_model.dart';

class Item extends Equatable {
  const Item({
    required this.productId,
    required this.quantity,
  });
  final ProductID productId;
  final int quantity;

  @override
  List<Object?> get props => [productId, quantity];

  @override
  bool? get stringify => true;
}
