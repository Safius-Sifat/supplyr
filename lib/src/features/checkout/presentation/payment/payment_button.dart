import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:supplyr/src/utils/async_value_ui.dart';

import 'payment_button_controller.dart';

class PaymentButton extends ConsumerWidget {
  const PaymentButton({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.listen<AsyncValue>(
      paymentButtonControllerProvider,
      (_, state) => state.showAlertDialogOnError(context),
    );
    final state = ref.watch(paymentButtonControllerProvider);
    return ElevatedButton(
      onPressed: state.isLoading
          ? null
          : () => ref.read(paymentButtonControllerProvider.notifier).pay(),
      child: state.isLoading
          ? const CircularProgressIndicator()
          : const Text('Pay'),
    );
  }
}
