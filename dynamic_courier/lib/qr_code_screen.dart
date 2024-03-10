import 'package:flutter/material.dart';
import 'package:flutter_projects/src/common_widgets/printable_doc.dart';
import 'package:flutter_projects/src/features/authentication/controllers/parcel_booking_controller.dart';
import 'package:flutter_projects/src/utils/theme/colors/colors.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class QrCodeScreen extends StatefulWidget {
  const QrCodeScreen({super.key});

  @override
  State<QrCodeScreen> createState() => QrCodeScreenState();
}

class QrCodeScreenState extends State<QrCodeScreen> {
  final controller = Get.put(ParcelBookingController());
   late List<String> data;

  @override
  void initState() {
    super.initState();
    // Assign values to the data list
    getValue();


  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child:Container(
                decoration: BoxDecoration(
                  border: Border.all(
                    color: Colors.grey, // Adjust color as needed
                    width: 1.0,
                  ),
                ),
                child: Column(
                  children: [
                    const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text('Ordered through \n Dynamic Courier Service',textAlign: TextAlign.center,),
                      ],
                    ),
                    const Divider(thickness: 2.0,color: Colors.grey,),
                    const SizedBox(height: 10.0),
                    const Text('Shipping/Customer address:\n',),
                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey, // Adjust color as needed
                          width: 1.0,
                        ),
                      ),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height:153,
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey, // Adjust color as needed
                                  width: 1.0,
                                ),
                              ),

                              child: Column(
                                  children: [
                                    SizedBox(
                                        width:160,
                                        child: Text('Name: ${data[1]}',textAlign: TextAlign.start,)),
                                    SizedBox(
                                        width: 160,
                                        child: Text(data[2],textAlign: TextAlign.start)),
                                  ]),
                            ),
                            // Text(controller.recipientNameController.text),

                            Container(
                              decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey, // Adjust color as needed
                                  width: 2.0,
                                ),
                              ),
                              child: Positioned(
                                left: 100,
                                right: 0,
                                child: QrImageView(
                                  data: data.join("\n"), // Join the list values into a single string
                                  version: QrVersions.auto,
                                  backgroundColor: Colors.white,
                                  size: 150,

                                ),
                              ),
                            ),
                          ]),

                    ),
                    Text(
                      'Send By: ${data[0]}',
                    ),
                    const Divider(thickness: 2.0,color: Colors.grey,),
                    const Text("Description"),
                    const Divider(thickness: 2.0,color: Colors.grey,),
                    Text(data[3]),
                  ],
                ),
              ),
            ),

          ),
          const SizedBox(
            height: 24,
          ),
          const SizedBox(
            height: 24.0,
          ),
          RawMaterialButton(
            onPressed: () async{
              var prefrences= await SharedPreferences.getInstance();
              await printDoc(prefrences);
              setState(() {
                getValue();

              });
            },
            fillColor: tThemeMain,
            shape: const StadiumBorder(),
            padding: const EdgeInsets.symmetric(
              horizontal: 36.0,
              vertical: 16.0,
            ),
            child: const Text(
              "Save as PDF",
              style: TextStyle(color: Colors.white,fontSize:20),

            ),
          ),
        ],
      ),
    );

  }
  void getValue() async{
    var prefs= await SharedPreferences.getInstance();
    String name=prefs.getString("sendername").toString();
    String rname=prefs.getString("recivername").toString();
    String address=prefs.getString("address").toString();
    String desc=prefs.getString("description").toString();

    setState(() {
      data=[name,rname,address,desc];
    });

  }


}






