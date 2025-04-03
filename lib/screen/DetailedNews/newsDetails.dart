import 'package:flutter/material.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';
import 'package:newsreadera/models/newsModel.dart';
import 'package:newsreadera/screen/Home/homeScreen.dart';

class NewsDetailsScreen extends StatelessWidget {
  final NewsModel comp;
  const NewsDetailsScreen({super.key, required this.comp});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        backgroundColor: Colors.transparent,
        elevation: 0,
        children: [
          SpeedDialChild(
              child: const Icon(Icons.home_rounded),
              onTap: () {
                Get.to(() => const HomeScreen());
              }),
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
                Row(
                  children: [
                    InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: Container(
                        child: const Row(
                          children: [
                            Icon(Icons.arrow_back_ios_new),
                            Text("Back"),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 30),
                Container(
                  // height: 330,
                  decoration: BoxDecoration(
                    // color: Colors.red,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Row(
                    children: [
                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: Image.network(
                            comp.urlToImage ??
                                "https://cdn.pixabay.com/photo/2016/02/01/00/56/news-1172463_1280.jpg",
                            fit: BoxFit.cover,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const SizedBox(height: 20),
                Text(
                  comp.title ?? 'Title Not available',
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    Text(
                      comp.publishedAt ?? '00:00',
                      style: Theme.of(context).textTheme.labelSmall,
                    )
                  ],
                ),
                const SizedBox(height: 10),
                Row(
                  children: [
                    CircleAvatar(
                      radius: 15,
                      backgroundColor: Colors.blueAccent,
                      child: Text(
                        comp.author![0],
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Text(
                        comp.author ?? 'Unkown',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.primaryContainer,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  // height: 30,
                ),
                const SizedBox(height: 20),
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        comp.description ?? "No Description",
                        style: TextStyle(
                            fontSize: 18,
                            color: Theme.of(context)
                                .colorScheme
                                .secondaryContainer),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
