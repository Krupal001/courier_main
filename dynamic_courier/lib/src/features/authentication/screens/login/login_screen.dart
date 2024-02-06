import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Stack(
        children: [
          Positioned(

            child: Column(
              children: [
                Image(image: AssetImage("assets/images/redbike.png"),height:100,),

              ],
          ),),
        ],

     ),

    );
  }
}
