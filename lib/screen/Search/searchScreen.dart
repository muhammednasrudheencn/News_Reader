import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:newsreadera/controller/newsController.dart';
import 'package:newsreadera/screen/DetailedNews/newsDetails.dart';
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
    NewsController newsController = Get.put(NewsController());
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  const SearchWidget(),
                  const SizedBox(
                    height: 20,
                  ),
                  Obx(
                    () => newsController.newsForYouList.isEmpty
                        ? const Center(
                            child: Text('Please Search Available Topics....'),
                          )
                        : Column(
                            children: newsController.newsForYouList
                                .map((e) => NewsTile(
                                      imageUrl: e.urlToImage ??
                                          'https://cdn.pixabay.com/photo/2016/02/01/00/56/news-1172463_1280.jpg',
                                      title: e.title ?? 'No Title',
                                      time: e.publishedAt ?? '00:00',
                                      author: e.author ?? 'Unknown',
                                      ontap: () {
                                        Get.to(
                                            () => NewsDetailsScreen(comp: e));
                                      },
                                    ))
                                .toList(),
                          ),
                  )
                ],
              ),
            ),
          ),
        ));
  }
}
