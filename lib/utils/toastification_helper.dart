import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';

mixin ToastificationHelper {
  void showAlertError(String message) {
    toastification.show(primaryColor: Colors.red, style: ToastificationStyle.minimal, description: Text(message));
  }

  void showAlertSuccess(String message) {
    toastification.show(primaryColor: Colors.green, style: ToastificationStyle.minimal, description: Text(message));
  }
}
