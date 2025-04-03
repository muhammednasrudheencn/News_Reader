import 'package:animated_toggle_switch/animated_toggle_switch.dart';
import 'package:flutter/material.dart';
import 'package:newsreadera/config/colors.dart';
import 'package:newsreadera/screen/Home/widgets/newsCard.dart';
import 'package:newsreadera/screen/Home/widgets/newstile.dart';
import 'package:flutter_speed_dial/flutter_speed_dial.dart';
import 'package:get/get.dart';

import '../../main.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var isdark = false;
  // ThemeMode themeMode = ThemeMode.light;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          // IconButton(
          //     onPressed: () {
          //       setState(() {
          //         themeMode = themeMode == ThemeMode.light
          //             ? ThemeMode.dark
          //             : ThemeMode.light;
          //       });
          //     },
          //     icon: isdark
          //         ? const Icon(Icons.light_mode_outlined)
          //         : const Icon(Icons.dark_mode_outlined))
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
          SpeedDialChild(child: Icon(Icons.settings)),
        ],
      ),
      body: Padding(
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
            // Row(
            //   children: [
            //     NewsCard(
            //         imageUrl: 'imageUrl',
            //         tag: 'tag',
            //         time: '10:33',
            //         title: 'hello',
            //         author: 'dff',
            //         ontap: () {}),
            //     NewsCard(
            //         imageUrl: 'imageUrl',
            //         tag: 'tag',
            //         time: '10:33',
            //         title: 'hello',
            //         author: 'dff',
            //         ontap: () {})
            //   ],
            // )
            SizedBox(
              height: 340,
              child: ListView.builder(
                  itemCount: 5,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return NewsCard(
                        imageUrl:
                            'https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=',
                        tag: 'tag',
                        time: '10:33',
                        title: 'hello',
                        author: 'dff',
                        ontap: () {});
                  }),
            ),
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
            SizedBox(
              height: 300,
              child: Expanded(
                child: ListView.builder(
                    itemCount: 5,
                    itemBuilder: (context, index) {
                      return NewsTile(
                          imageUrl:
                              'https://media.istockphoto.com/id/1369150014/vector/breaking-news-with-world-map-background-vector.jpg?s=612x612&w=0&k=20&c=9pR2-nDBhb7cOvvZU_VdgkMmPJXrBQ4rB1AkTXxRIKM=',
                          title: 'title',
                          time: 'time',
                          author: 'author',
                          ontap: () {});
                    }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
