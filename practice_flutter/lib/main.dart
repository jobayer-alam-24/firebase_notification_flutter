import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:practice_flutter/services/notification_manager.dart';

import 'app.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationManager.initialize();
  print(await NotificationManager.getDeviceToken());
  runApp(MaterialApp(
    home: const MyApp(),
  ));
}

