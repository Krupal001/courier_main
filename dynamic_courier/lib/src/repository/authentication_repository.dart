import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_projects/src/features/authentication/screens/welcome/welcome_main.dart';
import 'package:flutter_projects/src/repository/exceptions/signup_mail_password_failure.dart';
import 'package:get/get.dart';

import '../features/authentication/screens/dashboard/home_screen.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  //variables
  final _auth=FirebaseAuth.instance;
  late final Rx<User?> firebaseUser;

  @override
  void onReady() {
    firebaseUser= Rx<User?> (_auth.currentUser);
    firebaseUser.bindStream(_auth.userChanges());
    ever(firebaseUser, _setInitialScreen);
  }

  _setInitialScreen(User? user) {
    //user==null?Get.offAll(()=>const WelcomeScreen()):Get.offAll(()=>const Dashboard());
  }
  Future<void> createUserWithEmailAndPassword(String email,String password)async{
      try{
      await _auth.createUserWithEmailAndPassword(email: email, password: password);
      firebaseUser.value!=null?Get.offAll(()=>const Dashboard()):Get.offAll(()=>const WelcomeScreen());
      }on FirebaseAuthException catch(e){
        final ex=SignupWithEmailAndPasswordFailure.code(e.code);
        print('FIREBASE AUTH EXCEPTION-${ex.message}');
        throw ex;
      } catch(_){
        const ex=SignupWithEmailAndPasswordFailure();
        print('EXCEPTION-${ex.message}');
        throw ex;
      }
  }

    Future<void> loginWithEmailAndPassword(String email,String password)async {

        await _auth.signInWithEmailAndPassword(email: email, password: password);
      }
      Future<void> logout() async => await _auth.signOut();


    }