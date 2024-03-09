import 'package:exportsandcharts/firebase_options.dart';
import 'package:exportsandcharts/pages/home_page.dart';
import 'package:exportsandcharts/utils/notification_service.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await NotificationService.initMessaging();

  runApp(MyApp()
      // MaterialApp(
      //   home: HomePage(),
      //   debugShowCheckedModeBanner: false,
      // ),
      );
}

final GoRouter _goRouter = GoRouter(
  initialLocation: '/',
  routes: [
    GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return HomePage();
        }),
  ],
);

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _goRouter,
    );
  }
}
