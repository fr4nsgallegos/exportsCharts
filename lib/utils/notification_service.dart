import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> initMessaging() async {
    String token = await firebaseMessaging.getToken() ?? "-";
    print("TOKEN: $token");
  }
}
