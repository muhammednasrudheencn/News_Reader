import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newsreadera/config/colors.dart';

class NewsTile extends StatelessWidget {
  final String imageUrl;
  final String title;
  final String time;
  final String author;
  final VoidCallback ontap;

  const NewsTile(
      {super.key,
      required this.imageUrl,
      required this.title,
      required this.time,
      required this.author,
      required this.ontap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: ontap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 15),
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primaryContainer,
            borderRadius: BorderRadius.circular(20)),
        child: Row(
          children: [
            Container(
              width: 120,
              height: 100,
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.background,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        radius: 12,
                        backgroundColor: Get.isDarkMode
                            ? lightPrimaryColor
                            : darkPrimaryColor,
                        child: CircleAvatar(
                          radius: 10,
                          backgroundColor:
                              Theme.of(context).colorScheme.primary,
                          child: Text(
                            author[0],
                            style: const TextStyle(
                                fontSize: 10,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Flexible(
                          child: Text(
                        author,
                        maxLines: 1,
                      ))
                    ],
                  ),
                  const SizedBox(height: 15),
                  Text(
                    title,
                    maxLines: 2,
                  ),
                  const SizedBox(height: 15),
                  Text(
                    time,
                    style: Theme.of(context).textTheme.labelSmall,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class NewsTileRefresh extends StatelessWidget {
  const NewsTileRefresh({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      width: MediaQuery.of(context).size.width,
      alignment: Alignment.center,
      child: const CircularProgressIndicator(),
    );
  }
}
