import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsreadera/controller/splashController.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

SplashController splashController = Get.put(SplashController());

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    splashController.navigateToHome();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SizedBox(
          width: 100,
          height: 100,
          child: Image.asset('Assets/Photos/NewsReader.jpg'),
        ),
      ),
    );
  }
}
