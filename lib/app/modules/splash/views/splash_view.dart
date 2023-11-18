import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());
    return Scaffold(
        body: Center(
      child: Image.asset(
        'assets/image/png/bus_logo.png',
        // fit: BoxFit.fill,
        // width: double.infinity,
        // height: double.infinity,
      ),
    ));
  }
}
