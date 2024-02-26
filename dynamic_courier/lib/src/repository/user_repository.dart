import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/src/features/authentication/models/users_models.dart';
import 'package:get/get.dart';

class UserRepository extends GetxController{
  static UserRepository get instance=>Get.find();

  final _db=FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db.collection("Merchants").add(user.toJson()).whenComplete
      (() => Get.snackbar("Success", "Your account has been created!",
    snackPosition: SnackPosition.TOP,
        backgroundColor:Colors.green,
      colorText: Colors.white),)

    .catchError((error,stackTrace){
      Get.snackbar("Error", "Something went wrong. Try again!",
      snackPosition: SnackPosition.BOTTOM,
      backgroundColor: Colors.redAccent.withOpacity(0.1),
      colorText: Colors.red);
      print(error.toString());
    });
  }
  Future<UserModel>getUserDetails(String email)async{
    final snapshot=await _db.collection("Merchants").where("Email",isEqualTo: email).get();
    final userdata=snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;
    return userdata;

  }
}