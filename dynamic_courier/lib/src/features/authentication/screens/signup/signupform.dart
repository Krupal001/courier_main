import 'package:flutter/material.dart';
import 'package:flutter_projects/src/features/authentication/controllers/signup_controller.dart';
import 'package:flutter_projects/src/features/authentication/models/users_models.dart';
import 'package:flutter_projects/src/utils/Validations/validations.dart';
import 'package:get/get.dart';

import '../../../../constants/strings.dart';
import '../../../../utils/theme/colors/colors.dart';

class SignupForm extends StatelessWidget {
  const SignupForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller=Get.put(SignupController());
    final formKey=GlobalKey<FormState>();
    return Form(
      key: formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextFormField(
            controller: controller.name,
            validator: (value)=>Tvalidator.validationEmptyText('Name', value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.person_2_outlined),
              labelText: tName,
              hintText: tName,
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
            controller: controller.phoneNo,
            validator: (value)=>Tvalidator.validatePhoneNumber(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.phone_android_sharp),
              labelText: tPhone,
              hintText: tPhone,
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
            controller: controller.email,
            validator: (value)=>Tvalidator.validateEmail(value),
            decoration: const InputDecoration(
              prefixIcon: Icon(Icons.mail_outlined),
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
            controller: controller.password,
            validator: (value)=>Tvalidator.validatePassword(value),
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
          const SizedBox(height: 40),
          SizedBox(
            width: double.infinity, height: 50,
            child: ElevatedButton(onPressed: () {
              if(formKey.currentState!.validate()){
                SignupController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());

                final user=UserModel(
                    name: controller.name.text.trim(),
                    email: controller.email.text.trim(),
                    phone: controller.phoneNo.text.trim(),
                    password: controller.password.text.trim());

                SignupController.instance.createUser(user);
              }
            },
                style: ElevatedButton.styleFrom(
                  elevation: 10,
                  shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(15))),
                  backgroundColor: tThemeMain,
                  foregroundColor: Colors.white,

                  side: const BorderSide(color: tThemeMain),
                  //padding: const EdgeInsets.symmetric(horizontal: 60,vertical: 25),

                ),
                child: const Text("SIGN UP", style: TextStyle(
                    fontSize: 25,
                    fontFamily: "Arial"))),

          ),
          //
        ],),
    );
  }
}