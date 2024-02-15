import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/src/features/authentication/models/firm_location_model.dart';
import 'package:flutter_projects/src/features/authentication/models/users_models.dart';
import 'package:get/get.dart';

class FirmLocationController extends GetxController{
  static FirmLocationController get instance=>Get.find();

  final _db=FirebaseFirestore.instance;
  final location=TextEditingController();

  Future<void> firmLocation(FirmLocationModel firm) async {
    await _db.collection("Firm_Location").add(firm.toJson()).whenComplete
      (() => Get.snackbar("Success", "Your location has been added!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor:Colors.green.withOpacity(0.1),
        colorText: Colors.green),)

        .catchError((error,stackTrace){
      Get.snackbar("Error", "Something went wrong. Try again!",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
      print(error.toString());
    });
  }
}