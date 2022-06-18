import 'package:clean_code_snippets/src/core/utils/app_palette.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AppConstants {
  static void showErrorDialog({
    required BuildContext context,
    required String msg,
  }) {
    showDialog(
      context: context,
      builder: (context) => CupertinoAlertDialog(
        title: Text(msg),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Ok'),
            style: TextButton.styleFrom(
              primary: Colors.black,
              textStyle: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  static void showToast({
    required String msg,
    Color? color,
    ToastGravity? gravity,
  }) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_LONG,
      gravity: gravity ?? ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: color ?? AppPalette.primary,
      fontSize: 16.0.sp,
    );
  }
}
