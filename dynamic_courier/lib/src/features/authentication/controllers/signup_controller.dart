import 'package:flutter/cupertino.dart';
import 'package:flutter_projects/src/features/authentication/models/users_models.dart';
import 'package:flutter_projects/src/repository/authentication_repository.dart';
import 'package:flutter_projects/src/repository/user_repository.dart';
import 'package:flutter_projects/src/utils/loader/full_screen_loader.dart';
import 'package:get/get.dart';

import '../../../utils/helper/helper_controller.dart';

class SignupController extends GetxController{
  static SignupController get instance=>Get.find();
  final isGoogleLoading=false.obs;
  final userRepo=Get.put(UserRepository());
  final hidePassword=true.obs;
  final email=TextEditingController();
  final password=TextEditingController();
  final name=TextEditingController();
  final phoneNo=TextEditingController();

  //call this function from design and it will do the rest
  void registerUser(String email,String password){
    //TFullScreenLaoder.openLoadingDialog("We are processing your information ..", "assets/images/Animation_loader.gif");
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }
  Future<void> googleSignIn()async {
    try {
      isGoogleLoading.value = true;
      await AuthenticationRepository.instance.signInWithGoogle();
      isGoogleLoading.value = false;
    } catch (e) {
      isGoogleLoading.value = false;
      Helper.errorSnackBar(title: "Error", message: e.toString());
    }
  }
  }