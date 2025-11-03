import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InitialhealthController extends GetxController {
  //TODO: Implement InitialhealthController

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isObscure = true.obs;
  var isConfirmObscure = true.obs;

  void toggle() {
    isObscure.value = !isObscure.value;
  }
}
