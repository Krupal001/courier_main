import 'package:flutter/material.dart';
import 'package:flutter_projects/src/utils/helper/helper_controller.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();


  final isGoogleLoading=false.obs;
  /// TextField Controllers to get data from TextFields
  final email = TextEditingController();
  final password = TextEditingController();

  /// TextField Validation

  //Call this Function from Design & it will do the rest
  void login(String email,String password) {
    AuthenticationRepository.instance.loginWithEmailAndPassword(email, password);
  }
  Future<void> googleSignIn()async{
    try{
      isGoogleLoading.value=true;
      await AuthenticationRepository.instance.signInWithGoogle();
      isGoogleLoading.value=false;
    }catch(e){
      isGoogleLoading.value=false;
      Helper.errorSnackBar(title: "Error",message:e.toString());
    }

  }
}