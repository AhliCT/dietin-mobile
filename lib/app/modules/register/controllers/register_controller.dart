import 'package:flutter/material.dart';
import 'package:get/get.dart';

class RegisterController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  var isObscure = true.obs;
  var isConfirmObscure = true.obs;

  void toggle() {
    isObscure.value = !isObscure.value;
  }
}
