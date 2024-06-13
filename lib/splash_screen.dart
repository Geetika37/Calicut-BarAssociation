import 'package:calicut_barassociation/web_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
        init: SplashController(),
        builder: (context) {
          return Scaffold(
            backgroundColor: Colors.white,
            body: Center(
              child: SizedBox(
                child: Image.asset('assets/image/logo.png'),
              ),
            ),
          );
        });
  }
}

class SplashController extends GetxController {
  @override
  void onReady() {
    navigateToLogin();
    super.onReady();
  }

  Future navigateToLogin() async {
    await Future.delayed(const Duration(seconds: 2));
    Get.offAll(() => const WebScreen());
  }
}
