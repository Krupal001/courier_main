import 'package:flutter/material.dart';
import 'package:flutter_projects/src/features/authentication/controllers/firm_location_controller.dart';
import 'package:flutter_projects/src/features/authentication/models/firm_location_model.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../utils/theme/colors/colors.dart';

class AddLocationPage extends StatefulWidget {
  const AddLocationPage({super.key});

  @override
  AddLocationPageState createState() => AddLocationPageState();
}

class AddLocationPageState extends State<AddLocationPage> {


  @override
  Widget build(BuildContext context) {
    final controller=Get.put(FirmLocationController());
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 50),
            const Text("Add Location",style: TextStyle(
              fontFamily: "Open Sans",
              fontSize: 35,
              fontWeight: FontWeight.bold,
              color: tThemeMain,
            ),textAlign: TextAlign.center,),
            const SizedBox(height: 30),
            // Text area for entering location
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextField(
                controller: controller.location,
                decoration: const InputDecoration(labelText: 'Please Enter your firm Location',border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(15),)),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: tThemeMain),),
                  errorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                  focusedErrorBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red)),
                ), keyboardType: TextInputType.multiline,
                minLines: 1, // <-- SEE HERE
                maxLines: 5, ),
            ),

           // const SizedBox(height: 16),
            // Button to add location
            Padding(
              padding: const EdgeInsets.all(25.0),
              child: SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    final firmloc=FirmLocationModel(firmAddress:controller.location.text);
                    FirmLocationController.instance.firmLocation(firmloc);
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
                  child: const Text('Save'),
                ),
              ),
            ),
            const SizedBox(height: 30,),
        const Expanded(
          child: Align(
            alignment: Alignment.bottomRight,
            child: Image(
              image: AssetImage("assets/images/Address-cuate.png"),
              height: 800, // Adjust the height as needed
            ),
          ),),
          ],
        ),
      ),
    );
  }


}


