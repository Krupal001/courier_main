import 'package:flutter/material.dart';
import 'package:flutter_projects/src/features/authentication/screens/forgotpass/forgotpassscreen.dart';

import '../../../../constants/strings.dart';
import '../../../../utils/theme/colors/colors.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Form(child: Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_2_outlined),
              labelText: tEmail,
              hintText: tEmail,
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
          const SizedBox(height: 20,),
          TextFormField(
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.fingerprint),
              labelText: tPass,
              hintText: tPass,
              suffixIcon: IconButton(
                  onPressed: null, icon: Icon(Icons.remove_red_eye_sharp)),
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
          const SizedBox(height: 20,),
          Align(alignment: Alignment.centerRight,
              child: TextButton(onPressed: () {
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>const ForgotPassMailScreen()));
              },
                  child: const Text("Forgot Password ?",
                    style: TextStyle(color: tThemeMain, fontSize: 17),))),
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity, height: 50,
            child: ElevatedButton(onPressed: () {},
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  backgroundColor: tThemeMain,
                  foregroundColor: Colors.white,

                  side: const BorderSide(color: tThemeMain),
                  //padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 25),

                ),
                child: const Text("SIGN IN", style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Arial"))),

          ),
         //
         ],),
      ),
    );
  }
}