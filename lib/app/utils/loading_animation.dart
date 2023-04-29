import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:oonzoo_assignment/app/utils/urls.dart';

class LoadingAnimation extends StatelessWidget {
  const LoadingAnimation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Lottie.asset(
        Urls.animation,
        repeat: true,
      ),
    );
  }
}
