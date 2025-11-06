import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  var isObscure = true.obs;
  var isConfirmObscure = true.obs;

  void toggle() {
    isObscure.value = !isObscure.value;
  }
}
