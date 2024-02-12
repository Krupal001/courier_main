import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_projects/firebase_options.dart';
import 'package:flutter_projects/src/common_widgets/bottombar.dart';
import 'package:flutter_projects/src/features/authentication/screens/parcel/Add_location.dart';
import 'package:flutter_projects/src/features/authentication/screens/parcel/parcel_booking_form.dart';
import 'package:flutter_projects/src/features/authentication/screens/spalsh_screen/splash_screen.dart';
import 'package:flutter_projects/src/repository/authentication_repository.dart';
import 'package:flutter_projects/src/utils/theme/theme.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform).then((value) => Get.put(AuthenticationRepository()));
  runApp(const MyApp());

}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme:CAppTheme.lighttheme,
      darkTheme:CAppTheme.darktheme,
    themeMode: ThemeMode.system,
    home: const BottomNavBar(),
    );
  }


}

