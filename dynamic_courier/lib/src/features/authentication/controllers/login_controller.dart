import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  /// TextField Validation

  //Call this Function from Design & it will do the rest
  void login(String email,String password) {
    AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);

  }
}