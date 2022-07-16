import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_colors.dart';
import 'package:random_quote_clean_architecture_bloc_app/core/utils/app_strings.dart';

class Constants {
  static void showErrorDialog({
    required BuildContext context,
    required String message,
  }) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(
          message,
          style: const TextStyle(fontSize: 16.0),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            style: TextButton.styleFrom(
              primary: AppColors.primary,
              textStyle: const TextStyle(
                fontSize: 14.0,
                fontWeight: FontWeight.bold,
              ),
            ),
            child: const Text(AppStrings.ok),
          ),
        ],
      ),
    );
  }

  static void showToast({
    required String message,
    Color? backgroundColor,
    ToastGravity? toastGravity,
  }) {
    Fluttertoast.showToast(
      toastLength: Toast.LENGTH_LONG,
      backgroundColor: backgroundColor ?? AppColors.error,
      gravity: toastGravity ?? ToastGravity.BOTTOM,
      msg: message,
    );
  }
}
