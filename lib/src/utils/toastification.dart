import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

void errorToast(
    {required BuildContext ctx,
    required String title,
    required String description}) {
  toastification.show(
    context: ctx,
    title: Text(title,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    description: Text(description),
    type: ToastificationType.error,
    style: ToastificationStyle.flatColored,
    autoCloseDuration: const Duration(seconds: 5),
  );
}

void successToast({
  required BuildContext ctx,
  required String title,
}) {
  toastification.show(
    context: ctx,
    title: Text(title,
        style:
            const TextStyle(color: Colors.black, fontWeight: FontWeight.bold)),
    alignment: Alignment.bottomCenter,
    type: ToastificationType.success,
    style: ToastificationStyle.simple,
    autoCloseDuration: const Duration(seconds: 5),
  );
}
