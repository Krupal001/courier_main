import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_projects/src/utils/helper/helper_controller.dart';
class NotificationServices{

  FirebaseMessaging messaging=FirebaseMessaging.instance;
  void requestNotificationPermission() async{
    NotificationSettings settings=await messaging.requestPermission(
        alert: true,
        announcement: true,
        badge: true,
        carPlay: true,
        provisional: true,
        criticalAlert: true,
        sound: true,
    );
    if(settings.authorizationStatus==AuthorizationStatus.authorized){
      Helper.successSnackBar(title: 'success',message: "User granted permission");
    }
    else if(settings.authorizationStatus==AuthorizationStatus.provisional){
      Helper.successSnackBar(title: 'success',message: "User granted provisional permission");
    }
    else{
      Helper.warningSnackBar(title: 'Warning',message: 'User denied permission pls give permission manually');
    }
  }

}