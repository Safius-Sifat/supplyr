// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_orders_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userOrdersHash() => r'fc7cb9692f35a469d95db0e53085e000dc0174e2';

/// See also [userOrders].
@ProviderFor(userOrders)
final userOrdersProvider = AutoDisposeStreamProvider<List<Order>>.internal(
  userOrders,
  name: r'userOrdersProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$userOrdersHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef UserOrdersRef = AutoDisposeStreamProviderRef<List<Order>>;
String _$matchingUserOrdersHash() =>
    r'b669bcb9bff3d102a5cec1741cf9631288f0eaae';

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

/// See also [matchingUserOrders].
@ProviderFor(matchingUserOrders)
const matchingUserOrdersProvider = MatchingUserOrdersFamily();

/// See also [matchingUserOrders].
class MatchingUserOrdersFamily extends Family<AsyncValue<List<Order>>> {
  /// See also [matchingUserOrders].
  const MatchingUserOrdersFamily();

  /// See also [matchingUserOrders].
  MatchingUserOrdersProvider call(
    String id,
  ) {
    return MatchingUserOrdersProvider(
      id,
    );
  }

  @override
  MatchingUserOrdersProvider getProviderOverride(
    covariant MatchingUserOrdersProvider provider,
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
  String? get name => r'matchingUserOrdersProvider';
}

/// See also [matchingUserOrders].
class MatchingUserOrdersProvider
    extends AutoDisposeStreamProvider<List<Order>> {
  /// See also [matchingUserOrders].
  MatchingUserOrdersProvider(
    String id,
  ) : this._internal(
          (ref) => matchingUserOrders(
            ref as MatchingUserOrdersRef,
            id,
          ),
          from: matchingUserOrdersProvider,
          name: r'matchingUserOrdersProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$matchingUserOrdersHash,
          dependencies: MatchingUserOrdersFamily._dependencies,
          allTransitiveDependencies:
              MatchingUserOrdersFamily._allTransitiveDependencies,
          id: id,
        );

  MatchingUserOrdersProvider._internal(
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
    Stream<List<Order>> Function(MatchingUserOrdersRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: MatchingUserOrdersProvider._internal(
        (ref) => create(ref as MatchingUserOrdersRef),
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
  AutoDisposeStreamProviderElement<List<Order>> createElement() {
    return _MatchingUserOrdersProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is MatchingUserOrdersProvider && other.id == id;
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
mixin MatchingUserOrdersRef on AutoDisposeStreamProviderRef<List<Order>> {
  /// The parameter `id` of this provider.
  String get id;
}

class _MatchingUserOrdersProviderElement
    extends AutoDisposeStreamProviderElement<List<Order>>
    with MatchingUserOrdersRef {
  _MatchingUserOrdersProviderElement(super.provider);

  @override
  String get id => (origin as MatchingUserOrdersProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
