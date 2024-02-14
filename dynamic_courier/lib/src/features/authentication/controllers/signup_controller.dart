import 'package:flutter/cupertino.dart';
import 'package:flutter_projects/src/features/authentication/models/users_models.dart';
import 'package:flutter_projects/src/repository/authentication_repository.dart';
import 'package:flutter_projects/src/repository/user_repository.dart';
import 'package:flutter_projects/src/utils/loader/full_screen_loader.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
  static SignupController get instance=>Get.find();

  final userRepo=Get.put(UserRepository());

  final email=TextEditingController();
  final password=TextEditingController();
  final name=TextEditingController();
  final phoneNo=TextEditingController();

  //call this function from design and it will do the rest
  void registerUser(String email,String password){
    TFullScreenLaoder.openLoadingDialog("We are processing your information ..", "assets/images/Animation_loader.gif");
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
  }

}