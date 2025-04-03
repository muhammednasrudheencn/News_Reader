import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsreadera/config/theme.dart';
import 'package:newsreadera/screen/Home/homeScreen.dart';

void main() {
  runApp(const NewsReadera());
}

class NewsReadera extends StatefulWidget {
  const NewsReadera({super.key});

  @override
  State<NewsReadera> createState() => _NewsReaderaState();
}

class _NewsReaderaState extends State<NewsReadera> {
  // This widget is the root of your application.
  bool isDarkMode = false; // Boolean to track theme state

  void toggleTheme() {
    setState(() {
      isDarkMode = !isDarkMode; // Toggle theme
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'News Reader',
      theme: lightTheme,
      themeMode: isDarkMode ? ThemeMode.light : ThemeMode.dark,
      darkTheme: darkTheme,
      home: const HomeScreen(),
    );
  }
}
