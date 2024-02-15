import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../utils/theme/colors/colors.dart';

class ParcelBookingForm extends StatefulWidget {
  const ParcelBookingForm({super.key});

  @override
   ParcelBookingFormState createState() => ParcelBookingFormState();
}

class ParcelBookingFormState extends State<ParcelBookingForm> {
  final _formKey = GlobalKey<FormState>();
  final _recipientNameController = TextEditingController();
  final _recipientAddressController = TextEditingController();
  final _itemDescriptionController = TextEditingController();
  String _selectedPickupAddress = '';

  @override
  Widget build(BuildContext context) {
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
                controller: _itemDescriptionController,
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
                  StreamBuilder<QuerySnapshot>(
                    stream: FirebaseFirestore.instance.collection('firm_location').snapshots(),
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
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Pickup Address is required';
                          }
                          return null;
                        },
                      );
                    },
                  ),
                  const SizedBox(height: 20,),
                  TextFormField(
        
                    controller: _recipientNameController,
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
                    controller: _recipientAddressController,
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
                  ),
                  const SizedBox(height: 20),
                  TextFormField(
                    controller: _itemDescriptionController,
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
                    child: ElevatedButton(
                      onPressed: () {
                        _submitForm();
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
      String recipientName = _recipientNameController.text;
      String recipientAddress = _recipientAddressController.text;
      String itemDescription = _itemDescriptionController.text;


    }
  }
}
