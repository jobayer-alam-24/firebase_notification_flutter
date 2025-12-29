import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationManager {
  static Future<void> initialize() async
  {
    await FirebaseMessaging.instance.requestPermission();

    FirebaseMessaging.onMessageOpenedApp.listen(_handler);
    FirebaseMessaging.onMessage.listen(_handler);
    FirebaseMessaging.onBackgroundMessage(_backgroundHandler);

  }
  static Future<String?> getDeviceToken()
  async {
    return await FirebaseMessaging.instance.getToken();
  }
  static void _handler(RemoteMessage messege)
  {
    print(messege.data);
    print(messege.notification!.title);
    print(messege.notification!.body);
  }
}
Future<void> _backgroundHandler(RemoteMessage messege) async
{
  print(messege.data);
  print(messege.notification!.title);
  print(messege.notification!.body);
}
