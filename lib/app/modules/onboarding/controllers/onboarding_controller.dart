import 'package:get/get.dart';
import 'package:flutter/animation.dart';
import 'package:flutter/material.dart';

class OnboardingController extends GetxController
    with GetTickerProviderStateMixin {
  late AnimationController ac;
  late Animation<Offset> slideUp;
  final played = false.obs;

  @override
  void onInit() {
    super.onInit();
    ac = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 450),
    );

    slideUp = Tween<Offset>(
      begin: Offset.zero,
      end: const Offset(0, -1.2),
    ).animate(CurvedAnimation(parent: ac, curve: Curves.easeInOut));

    ac.addStatusListener((status) {
      if (status == AnimationStatus.completed && !played.value) {
        played.value = true;
        Get.offNamed('/login');
      }
    });
  }

  void start() {
    if (!ac.isAnimating) ac.forward();
  }

  @override
  void onClose() {
    ac.dispose();
    super.onClose();
  }
}
