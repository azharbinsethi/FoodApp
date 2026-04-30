import 'package:flutter/material.dart';
import 'package:flutter_application_1/auth/Seller_Dashboard_Home/dashboard.dart';

void main() {
  runApp(FoodApp());
}

class FoodApp extends StatelessWidget {
  const FoodApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SellerDashboard(),
    );
  }
}
