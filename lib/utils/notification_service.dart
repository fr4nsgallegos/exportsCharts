import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationService {
  static FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

  static Future<void> initMessaging() async {
    String token = await firebaseMessaging.getToken() ?? "-";
    print("TOKEN: $token");

    FirebaseMessaging.onMessage.listen(_onMessage);
    FirebaseMessaging.onBackgroundMessage(_onBackgroundMessage);
  }

  //DETECTAR EL MENSAJE CUANDO EL APP SE ENCUENTRA ABIERTO
  static _onMessage(RemoteMessage message) {
    if (message.notification != null) {
      print("APP ABIERTA------------------------");
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }

  //DETECTAR CUANDO EL APP ESTA EN SEGUNDO PLANO
  static Future _onBackgroundMessage(RemoteMessage message) async {
    print("SEGUNDO PLANO ***************************");
    print(message.notification!.title);
    print(message.notification!.body);
  }

  static Future _onMessageOpenedApp(RemoteMessage message) async {
    if (message.notification != null) {
      print(message.notification!.title);
      print(message.notification!.body);
    }
  }
}
