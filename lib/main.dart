import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lottery_app/features/home/view/home.dart';
import 'package:lottery_app/features/offers/controller/offer_controller.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
 @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Lottery App',
      theme: ThemeData(
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Home'),
    );
  }
}

