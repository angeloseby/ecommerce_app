import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../core/values/colors.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SplashView'),
        centerTitle: true,
      ),
      body: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(AppColors.kProgressIndicatorColor),
        ),
      ),
    );
  }
}
