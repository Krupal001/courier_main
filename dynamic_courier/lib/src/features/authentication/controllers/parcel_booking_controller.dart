import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/src/features/authentication/models/parcels_model.dart';
import 'package:get/get.dart';

class ParcelBookingController extends GetxController{
  static ParcelBookingController get instance=>Get.find();

  final sendername=TextEditingController();
  final recipientNameController = TextEditingController();
  final recipientAddressController = TextEditingController();
  final itemDescriptionController = TextEditingController();
  final itemCountController = TextEditingController();

  final _db=FirebaseFirestore.instance;

  Future<void> createParcel(ParcelModel parcel) async {
    await _db.collection("Parcels").add(parcel.toJson()).whenComplete
      (() => Get.snackbar("Success", "Your Shipment has been created!",
        snackPosition: SnackPosition.TOP,
        backgroundColor:Colors.green,
        colorText: Colors.white),)

        .catchError((error,stackTrace){
      Get.snackbar("Error", "Something went wrong. Try again!",
          snackPosition: SnackPosition.TOP,
          backgroundColor: Colors.redAccent,
          colorText: Colors.red);
      print(error.toString());
    });
  }
}