import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:newsreadera/screen/Home/homeScreen.dart';
import 'package:newsreadera/screen/Search/Widget/searchwidget.dart';

import '../Home/widgets/newsTile.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({super.key});

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        floatingActionButton: SpeedDial(
          animatedIcon: AnimatedIcons.menu_close,
          children: [
            SpeedDialChild(
              child: const Icon(Icons.home_rounded),
              onTap: () {
                Get.to(() => const HomeScreen());
              },
            ),
            SpeedDialChild(
                child: Get.isDarkMode
                    ? const Icon(Icons.light_mode_outlined)
                    : const Icon(Icons.dark_mode_outlined),
                onTap: () {
                  Get.changeThemeMode(
                      Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
                }),
          ],
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            children: [
              const SearchWidget(),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ListView.builder(
                    itemCount: 7,
                    itemBuilder: (context, index) {
                      return NewsTile(
                          imageUrl:
                              'https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=',
                          title: 'title',
                          time: 'time',
                          author: 'author',
                          ontap: () {});
                    }),
              )
            ],
          ),
        )));
  }
}
