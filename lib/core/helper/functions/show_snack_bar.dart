import 'package:fasn_ecommerce/core/router/app_router.dart';
import 'package:fasn_ecommerce/core/utils/app_colors.dart';
import 'package:flutter/material.dart';

// showSnackBar(context, {required String message, bool error = false}) {
//   final snackBar = SnackBar(
//     padding: 4.aEdge,
//     content: Text(
//       message,
//       textAlign: TextAlign.center,
//       style: const TextStyle(
//         fontSize: 18,
//         fontWeight: FontWeight.w500,
//         color: AppColors.white,
//       ),
//     ),
//     backgroundColor: error ? Colors.red : Colors.green,
//     duration: const Duration(seconds: 1),
//   );
//   ScaffoldMessenger.of(context).showSnackBar(snackBar);
// }

showSnackbar(String message, {bool error = false}) {
  closeSnackbar();

  ScaffoldMessenger.of(AppNavigator.context).showSnackBar(
    SnackBar(
      content: Text(
        message,
        textAlign: TextAlign.center,
        style: const TextStyle(
          fontSize: 18,
          fontWeight: FontWeight.w500,
          color: AppColors.white,
        ),
      ),
      backgroundColor: error ? Colors.red : Colors.green,
      duration: const Duration(seconds: 1),
    ),
  );
}

closeSnackbar() {
  ScaffoldMessenger.of(AppNavigator.context).clearSnackBars();
}
