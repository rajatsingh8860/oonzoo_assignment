import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'loading_animation.dart';

class LoadingUtils {
  static var isLoaderShowing = false;

  static void showLoader() {
    if (!isLoaderShowing) {
      Get.dialog(
        WillPopScope(
          onWillPop: () {
            return Future.value(false);
          },
          child: const Center(child: LoadingAnimation()),
        ),
        barrierDismissible: false,
      );
      isLoaderShowing = true;
    }
  }

  static void hideLoader() {
    if (isLoaderShowing) {
      Get.back();
      isLoaderShowing = false;
    }
  }
}