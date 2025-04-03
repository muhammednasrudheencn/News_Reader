import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsreadera/config/theme.dart';
import 'package:newsreadera/screen/Home/homeScreen.dart';

void main() {
  runApp(const NewsReadera());
}

class NewsReadera extends StatelessWidget {
  const NewsReadera({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Reader',
      theme: lightTheme,
      themeMode: ThemeMode.system,
      darkTheme: darkTheme,
      home: const HomeScreen(),
    );
  }
}
