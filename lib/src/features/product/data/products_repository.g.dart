// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'products_repository.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$productsRepositoryHash() =>
    r'1c54883e8d76ccfa9644b6d38280feb3b9e5bf73';

/// See also [productsRepository].
@ProviderFor(productsRepository)
final productsRepositoryProvider =
    AutoDisposeProvider<ProductsRepository>.internal(
  productsRepository,
  name: r'productsRepositoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsRepositoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductsRepositoryRef = AutoDisposeProviderRef<ProductsRepository>;
String _$productsListStreamHash() =>
    r'22462209e383d9cb6a76936536ec6a6993ce872a';

/// See also [productsListStream].
@ProviderFor(productsListStream)
final productsListStreamProvider =
    AutoDisposeStreamProvider<List<Product>>.internal(
  productsListStream,
  name: r'productsListStreamProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsListStreamHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductsListStreamRef = AutoDisposeStreamProviderRef<List<Product>>;
String _$productsListFutureHash() =>
    r'742610200192d5593bc85a891d018f70898e048a';

/// See also [productsListFuture].
@ProviderFor(productsListFuture)
final productsListFutureProvider =
    AutoDisposeFutureProvider<List<Product>>.internal(
  productsListFuture,
  name: r'productsListFutureProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$productsListFutureHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef ProductsListFutureRef = AutoDisposeFutureProviderRef<List<Product>>;
String _$productHash() => r'14fb39b833468547d27cb1147865057b0abe2ee8';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [product].
@ProviderFor(product)
const productProvider = ProductFamily();

/// See also [product].
class ProductFamily extends Family<AsyncValue<Product?>> {
  /// See also [product].
  const ProductFamily();

  /// See also [product].
  ProductProvider call(
    String id,
  ) {
    return ProductProvider(
      id,
    );
  }

  @override
  ProductProvider getProviderOverride(
    covariant ProductProvider provider,
  ) {
    return call(
      provider.id,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'productProvider';
}

/// See also [product].
class ProductProvider extends AutoDisposeStreamProvider<Product?> {
  /// See also [product].
  ProductProvider(
    String id,
  ) : this._internal(
          (ref) => product(
            ref as ProductRef,
            id,
          ),
          from: productProvider,
          name: r'productProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$productHash,
          dependencies: ProductFamily._dependencies,
          allTransitiveDependencies: ProductFamily._allTransitiveDependencies,
          id: id,
        );

  ProductProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final String id;

  @override
  Override overrideWith(
    Stream<Product?> Function(ProductRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ProductProvider._internal(
        (ref) => create(ref as ProductRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<Product?> createElement() {
    return _ProductProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ProductProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ProductRef on AutoDisposeStreamProviderRef<Product?> {
  /// The parameter `id` of this provider.
  String get id;
}

class _ProductProviderElement extends AutoDisposeStreamProviderElement<Product?>
    with ProductRef {
  _ProductProviderElement(super.provider);

  @override
  String get id => (origin as ProductProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
