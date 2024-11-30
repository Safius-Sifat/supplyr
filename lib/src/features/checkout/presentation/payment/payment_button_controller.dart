import 'dart:async';

import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../application/fake_checkout_service.dart';

part 'payment_button_controller.g.dart';

@riverpod
class PaymentButtonController extends _$PaymentButtonController {
  bool _mounted = true;

  @override
  FutureOr<void> build() {
    ref.onDispose(() => _mounted = false);
  }

  Future<void> pay() async {
    final checkoutService = ref.read(checkoutServiceProvider);
    state = const AsyncLoading();
    final newState = await AsyncValue.guard(checkoutService.placeOrder);
    if (_mounted) {
      state = newState;
    }
  }
}
