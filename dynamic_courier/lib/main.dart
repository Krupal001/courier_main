import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/firebase_options.dart';
import 'package:flutter_projects/src/features/authentication/screens/forgotpass/forgotpassscreen.dart';
import 'package:flutter_projects/src/features/authentication/screens/login/login_screen.dart';
import 'package:flutter_projects/src/features/authentication/screens/signup/signup_screen.dart';
import 'package:flutter_projects/src/features/authentication/screens/spalsh_screen/splash_screen.dart';
import 'package:flutter_projects/src/features/authentication/screens/welcome/welcome_main.dart';
import 'package:flutter_projects/src/features/authentication/screens/welcome/welcome_screen_first.dart';
import 'package:flutter_projects/src/utils/theme/theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme:CAppTheme.lighttheme,
      darkTheme:CAppTheme.darktheme,
    themeMode: ThemeMode.system,
    home: const SplashScreen(),
    );
  }


}

