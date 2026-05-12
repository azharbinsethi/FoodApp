import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/Seller_Dashboard_Home/dashboard.dart';
import 'package:flutter_application_1/auth/login/authentication/login.dart';
import 'package:flutter_application_1/auth/splashScreen/Splash.dart';
import 'package:flutter_application_1/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
    // return MaterialApp(
    //   debugShowCheckedModeBanner: false,
    //   home: SellerDashboard(),
    // );
  }
}
