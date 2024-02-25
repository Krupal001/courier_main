import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/src/features/authentication/controllers/signup_controller.dart';
import 'package:flutter_projects/src/features/authentication/models/firm_location_model.dart';
import 'package:flutter_projects/src/features/authentication/models/users_models.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository.dart';

class FirmLocationController extends GetxController{
  static FirmLocationController get instance=>Get.find();
  final controller=Get.put(SignupController());
  final authRepo=Get.put(AuthenticationRepository());
  final _db=FirebaseFirestore.instance;
  final location=TextEditingController();
  final firmName=TextEditingController();



  Future<void> firmLocation(FirmLocationModel firm,) async {
    // final email=authRepo.firebaseUser.value?.email;
    User? user = FirebaseAuth.instance.currentUser;

    if (user != null) {
      final String merchantEmail = user.email!;
      QuerySnapshot merchantQuery = await FirebaseFirestore.instance
          .collection("merchants")
          .where("Email", isEqualTo: merchantEmail)
          .get();
      print("====****************************====" +
          merchantQuery.docs.single.id);
      if (merchantQuery.docs.isNotEmpty) {
        // Assuming there is only one merchant with the given email
        final String merchantId = merchantQuery.docs.first.id;

        await _db.collection("Merchants").doc(merchantId).collection(
            "Firm-Address").add(firm.toJson()).whenComplete
          (() =>
            Get.snackbar("Success", "Your location has been added!",
                snackPosition: SnackPosition.BOTTOM,
                backgroundColor: Colors.green.withOpacity(0.1),
                colorText: Colors.green),)
            .catchError((error, stackTrace) {
          Get.snackbar("Error", "Something went wrong. Try again!",
              snackPosition: SnackPosition.BOTTOM,
              backgroundColor: Colors.redAccent.withOpacity(0.1),
              colorText: Colors.red);
          print(error.toString());
        });
      }
    }
  }

}
