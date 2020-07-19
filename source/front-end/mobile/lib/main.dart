import 'package:flutter/material.dart';
import 'package:mobile/constants/app_constants.dart';
import 'package:mobile/screens/about_screen.dart';
import 'package:mobile/screens/connect_screen.dart';
import 'package:mobile/screens/main_screen.dart';
import 'package:mobile/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData.light(),
        debugShowCheckedModeBanner: false,
        initialRoute: kSplashScreenID,
        routes: {
          kAboutScreenID: (context) => AboutScreen(),
          kConnectScreenID: (connect) => ConnectScreen(),
          kMainScreenID: (context) => MainScreen(),
          kSplashScreenID: (context) => SplashScreen(),
        });
  }
}
