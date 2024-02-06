import 'package:flutter/material.dart';
import 'package:flutter_projects/src/constants/image_strings.dart';
import 'package:flutter_projects/src/constants/strings.dart';
import 'package:flutter_projects/src/utils/theme/colors/colors.dart';

class WelcomeScreen extends StatefulWidget {
  const WelcomeScreen({super.key});

  @override
  State<WelcomeScreen> createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  Widget build(BuildContext context) {
    var height=MediaQuery.of(context).size.height;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
             Image(image: const AssetImage(tWelcomeScreen),height: height *0.4,),
              Column(
              children: [
                const Text(tWelcomeTitle,style: TextStyle(
                    fontFamily: 'Oregano',
                    fontSize: 40.0,
                    fontWeight: FontWeight.w800,

                ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 10),
                Text(tWelcomeSunTitle ,style: Theme.of(context).textTheme.bodyLarge,textAlign: TextAlign.center,),
              ],
            ),

            Row(
              children: [
                Expanded(
                  child: OutlinedButton(onPressed: (){},
                      style: OutlinedButton.styleFrom(
                        shape: const RoundedRectangleBorder(),
                        foregroundColor:tThemeMain,
                        side: const BorderSide(color: tThemeMain),
                        padding: const EdgeInsets.symmetric(vertical: 25)
                      ),
                      child: const Text("LOGIN")),
                ),
                const SizedBox(width: 10,),
                Expanded(
                  child: ElevatedButton(onPressed: (){},
                      style: ElevatedButton.styleFrom(
                        elevation: 10,
                          shape: const RoundedRectangleBorder(),
                          backgroundColor: tThemeMain,
                          foregroundColor:Colors.white,
                          side: const BorderSide(color: tThemeMain),
                          padding: const EdgeInsets.symmetric(vertical: 25)
                      ),
                      child: const Text("SIGNUP")),
                )
              ],
            )
          ],
        ),
      ),

    );


  }
}
