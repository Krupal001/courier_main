import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:http/http.dart' as http;

class SendNotification{

  Future<List<String>> getDeviceTokensFromFirestore() async {
    List<String> tokens = [];

    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('deviceTokens').get();

    for (QueryDocumentSnapshot doc in querySnapshot.docs) {
      // Assuming 'token' is the field in your Firestore document that stores the device token
      String token = doc.get('token');

      if (token.isNotEmpty) {
        tokens.add(token);
      }
    }

    return tokens;
  }

  void sendNotifications(){
  getDeviceTokensFromFirestore().then((List<String> tokens) async{
    for (var token in tokens) {
      var data = {
        'to': token,
        'priority': 'high',
        'notification': {
          'title': 'Parcel Request!',
          'body': 'New Parcel is Arrived!',
        },
        'data':{
          'type':'msg',
          'id':'dynamic1990'
        }
      };
      await http.post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
        body:jsonEncode(data),
        headers:{
          'Content-Type':'application/json; charset=UTF-8',
          'Authorization':'key=AAAAVv7wqlg:APA91bGty2wYEMEP1Pod2qpGgpZULYzS6SVtgxn4sc3gdkwyhSybGWW-aKR7_kyYfw6oLqteYNpaIpaUGBo_0JtQo2vBnEy4DJnLyWG4qTZrso_uFtRbL05JHhSxFRoFYwyhOUo5O20x',
        },
      );}
  });
}
}