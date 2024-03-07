import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/qr_code_screen.dart';
import 'package:flutter_projects/src/features/authentication/controllers/parcel_booking_controller.dart';
import 'package:flutter_projects/src/features/authentication/models/parcels_model.dart';
import 'package:flutter_projects/src/features/authentication/screens/notification/notification_services.dart';
import 'package:flutter_projects/src/utils/Validations/validations.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/theme/colors/colors.dart';

class ParcelBookingForm extends StatefulWidget {
  const ParcelBookingForm({super.key});

  @override
   ParcelBookingFormState createState() => ParcelBookingFormState();
}

class ParcelBookingFormState extends State<ParcelBookingForm> {
  final _formKey = GlobalKey<FormState>();
  String _selectedPickupAddress="";

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(ParcelBookingController());
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 36),
                  const Text("Parcel Booking",style: TextStyle(
                    fontFamily: "Open Sans",
                    fontSize: 35,
                    fontWeight: FontWeight.bold,
                    color: tThemeMain,
                  ),textAlign: TextAlign.center,),
                  //
              const SizedBox(height: 20),
              TextFormField(
                controller: controller.sendername,
                decoration: const InputDecoration(labelText: 'Sender name',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15),)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: tThemeMain),),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Sender name is required';
                  }
                  return null;
                },
              ),
                  const SizedBox(height: 20),
                /* StreamBuilder<QuerySnapshot>(
                     stream:FirebaseFirestore.instance
                       .collection('Merchants').snapshots(),
                    //     .doc(FirmLocationController.instance.getMerchantId(merchantQuery) as String?)  // Use the method to get the merchant ID
                    //     .collection('Firm-Address')
                    //     .snapshots(),
                    builder: (context, snapshot) {
                      if (!snapshot.hasData) {
                        return const CircularProgressIndicator(color: tThemeMain,);
                      }
        
                      List<String> pickupAddresses = snapshot.data!.docs.map((doc) => doc['address'] as String).toList();
        
                      return DropdownButtonFormField<String>(
                        value: _selectedPickupAddress,
                        onChanged: (value) {
                          setState(() {
                            _selectedPickupAddress = value!;
                          });
                        },
                        items: pickupAddresses.map((address) {
                          return DropdownMenuItem<String>(
                            value: address,
                            child: Text(address),
                          );
                        }).toList(),
                        decoration: const InputDecoration(labelText: 'Pickup Address',
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.all(Radius.circular(15),)),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: tThemeMain),),
                          errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                        ),
                        // validator: (value) {
                        //   if (value == null || value.isEmpty) {
                        //     return 'Pickup Address is required';
                        //   }
                        //   return null;
                        //},
                      );
                    },
                  ),*/
                 // const SizedBox(height: 20,),
                  TextFormField(
        
                    controller: controller.recipientNameController,
                    decoration: const InputDecoration(labelText: 'Recipient Name',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15),)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: tThemeMain),),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
        
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Recipient Name is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.recipientAddressController,
                    decoration: const InputDecoration(labelText: 'Recipient Address',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15),)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: tThemeMain),),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Recipient Address is required';
                      }
                      return null;
                    },
                    keyboardType: TextInputType.multiline,
                    minLines: 1, // <-- SEE HERE
                    maxLines: 5,
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.itemCountController,
                    validator: (value) =>Tvalidator.validateNumber(value),
                    decoration: const InputDecoration(labelText: 'no of parcels',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15),)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: tThemeMain),),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),


                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: controller.itemDescriptionController,
                    decoration: const InputDecoration(labelText: 'Item Description',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(15),)),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: tThemeMain),),
                      errorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                      focusedErrorBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.red)),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Item Description is required';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 36),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton (
                      onPressed: () async {
                        var prefs= await SharedPreferences.getInstance();
                        prefs.setString("sendername",controller.sendername.text);
                        prefs.setString("recivername",controller.recipientNameController.text);
                        prefs.setString("address",controller.recipientAddressController.text);
                        prefs.setString("description",controller.itemDescriptionController.text);
                        _submitForm();
                        final parcel=ParcelModel(
                            senderName: controller.sendername.text,
                            receiverName: controller.recipientNameController.text,
                            parcelQTY: controller.itemCountController.text,
                            senderAddress: "Delhi 582-3",
                            senderPhone: "8558774589",
                            receiverAddress: controller.recipientAddressController.text,
                            receiverPhone: "5898554748",
                            status:"Shipment Created",
                            dataCreated: DateTime.now().toString());
                        ParcelBookingController.instance.createParcel(parcel);
                      },
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                        shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(Radius.circular(15))),
                        backgroundColor: tThemeMain,
                        foregroundColor: Colors.white,
        
                        side: const BorderSide(color: tThemeMain),
                        padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 25),
        
                      ),
                      child: const Text('Book Parcel'),
                    ),
                  ),
        
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _submitForm() {
    if (_formKey.currentState?.validate() ?? false) {
      // Perform your parcel booking logic here
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const QrCodeScreen()));


    }
  }
}
