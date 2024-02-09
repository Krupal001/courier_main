import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignupController extends GetxController{
  static SignupController get instance=>Get.find();

  final email=TextEditingController();
  final password=TextEditingController();
  final name=TextEditingController();
  final phoneNo=TextEditingController();

  //call this function from design and it will do the rest
  void registerUser(String email,String password){

  }

}