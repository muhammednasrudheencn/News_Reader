import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsreadera/controller/newsController.dart';
import 'package:newsreadera/screen/DetailedNews/newsDetails.dart';
import 'package:newsreadera/screen/Home/widgets/newsCard.dart';
import 'package:newsreadera/screen/Home/widgets/newstile.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:newsreadera/screen/Search/searchScreen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

Future<void> pullToRefresh() async {
  return Future.delayed(const Duration(seconds: 2));
}

class _HomeScreenState extends State<HomeScreen> {
  // ThemeMode themeMode = ThemeMode.light;
  NewsController newsController = Get.put(NewsController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                Get.to(() => const SearchScreen());
              },
              icon: const Icon(Icons.search_rounded)),
          // IconButton(
          //   onPressed: () {
          //     Get.changeThemeMode(
          //         Get.isDarkMode ? ThemeMode.light : ThemeMode.dark);
          //   },
          //   icon: Get.isDarkMode
          //       ? const Icon(Icons.light_mode_outlined)
          //       : const Icon(Icons.dark_mode_outlined),
          // )
        ],
        title: Text(
          'News Reader',
          style: Theme.of(context).textTheme.headlineLarge,
        ),
      ),
      floatingActionButton: SpeedDial(
        animatedIcon: AnimatedIcons.menu_close,
        children: [
          SpeedDialChild(child: Icon(Icons.home_rounded)),
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
      body: RefreshIndicator(
        onRefresh: pullToRefresh,
        child: Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Hottest News',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'See All >',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Obx(
                    () => newsController.isHotNewsLoading.value
                        ? const Center(
                            child: CircularProgressIndicator(),
                          )
                        : Row(
                            children: newsController.hotNewsList
                                .map((e) => NewsCard(
                                      imageUrl: e.urlToImage!,
                                      tag: 'HotNo 1',
                                      time: e.publishedAt!,
                                      title: e.title!,
                                      author: e.author ?? 'Unknown',
                                      ontap: () {
                                        Get.to(
                                            () => NewsDetailsScreen(comp: e));
                                      },
                                    ))
                                .toList(),
                          ),
                  ))

              // SizedBox(
              //   height: 340,
              //   child: ListView.builder(
              //       itemCount: 5,
              //       scrollDirection: Axis.horizontal,
              //       itemBuilder: (context, index) {
              //         return NewsCard(
              //             imageUrl:
              //                 'https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=',
              //             tag: 'tag',
              //             time: '10:33',
              //             title: 'hello',
              //             author: 'dff',
              //             ontap: () {
              //               Get.to(() => const NewsDetailsScreen());
              //             });
              //       }),
              // ),
              ,
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'News For You',
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  Text(
                    'See All >',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              Obx(() => newsController.isNewsForYouLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: newsController.newsForYou5List
                          .map(
                            (e) => NewsTile(
                              ontap: () {
                                Get.to(() => NewsDetailsScreen(comp: e));
                              },
                              imageUrl: e.urlToImage ??
                                  "https://cdn.pixabay.com/photo/2016/02/01/00/56/news-1172463_1280.jpg",
                              title: e.title!,
                              author: e.author ?? 'Unknown',
                              time: e.publishedAt!,
                            ),
                          )
                          .toList(),
                    )),
              Obx(() => newsController.isAppleNewsLoading.value
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : Column(
                      children: newsController.appleNews5List
                          .map(
                            (e) => NewsTile(
                              ontap: () {
                                Get.to(() => NewsDetailsScreen(comp: e));
                              },
                              imageUrl: e.urlToImage ??
                                  "https://cdn.pixabay.com/photo/2016/02/01/00/56/news-1172463_1280.jpg",
                              title: e.title!,
                              author: e.author ?? 'Unknown',
                              time: e.publishedAt!,
                            ),
                          )
                          .toList(),
                    ))
            ],
          ),
        ),
      ),
    );
  }
}
