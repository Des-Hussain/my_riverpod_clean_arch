import 'package:my_riverpod_clean_arch/common/resources/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_riverpod_clean_arch/config/app_router.dart';

class ShowDialogBox {
  static bool isOpen = false;
  static showDialogBoxs(
    bool dismisss,
  ) {
    isOpen = true;
    return showDialog(
        context: globalContext!,
        barrierDismissible: dismisss,
        builder: (context) {
          isOpen = true;
          return Container(
            width: 130,
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
            height: 130,
            child: const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CupertinoActivityIndicator(
                  radius: 30,
                  color: AppColors.white,
                ),
              ],
            ),
          );
        }).then((value) {
      isOpen = false;
    });
  }
}
