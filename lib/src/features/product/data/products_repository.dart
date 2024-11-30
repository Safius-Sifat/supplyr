import 'dart:async';

import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../utils/in_memory_store.dart';
import '../domain/product_model.dart';

part 'products_repository.g.dart';

class ProductsRepository {
  ProductsRepository({this.addDelay = true});
  final bool addDelay;

  final _products = InMemoryStore<List<Product>>([
    ...demoPopularProducts,
    ...demoFlashSaleProducts,
    ...demoBestSellersProducts
  ]);

  List<Product> getProductsList() {
    return _products.value;
  }

  Product? getProduct(String id) {
    return _getProduct(_products.value, id);
  }

  Future<List<Product>> fetchProductsList() async {
    return Future.value(_products.value);
  }

  Stream<List<Product>> watchProductsList() {
    return _products.stream;
  }

  Stream<Product?> watchProduct(String id) {
    return watchProductsList().map((products) => _getProduct(products, id));
  }

  /// Update product or add a new one
  Future<void> setProduct(Product product) async {
    final products = _products.value;
    final index = products.indexWhere((p) => p.id == product.id);
    if (index == -1) {
      // if not found, add as a new product
      products.add(product);
    } else {
      // else, overwrite previous product
      products[index] = product;
    }
    _products.value = products;
  }

  static Product? _getProduct(List<Product> products, String id) {
    try {
      return products.firstWhere((product) => product.id == id);
    } catch (e) {
      return null;
    }
  }
}

@riverpod
ProductsRepository productsRepository(Ref ref) {
  return ProductsRepository(addDelay: false);
}

@riverpod
Stream<List<Product>> productsListStream(Ref ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.watchProductsList();
}

@riverpod
Future<List<Product>> productsListFuture(Ref ref) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.fetchProductsList();
}

@riverpod
Stream<Product?> product(Ref ref, ProductID id) {
  final productsRepository = ref.watch(productsRepositoryProvider);
  return productsRepository.watchProduct(id);
}
