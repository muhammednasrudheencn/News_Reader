import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/get_core.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:newsreadera/controller/newsController.dart';
// import 'package:news_app/Controller/NewsController.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({super.key});

  @override
  Widget build(BuildContext context) {
    NewsController newsController = Get.put(NewsController());

    TextEditingController searchController = TextEditingController();
    return Container(
      padding: const EdgeInsets.all(5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Theme.of(context).colorScheme.primaryContainer,
      ),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintText: "Search News ...",
                fillColor: Theme.of(context).colorScheme.primaryContainer,
                border: InputBorder.none,
              ),
            ),
          ),
          Obx(() => newsController.isNewsForYouLoading.value
              ? Container(
                  width: 50,
                  height: 50,
                  padding: const EdgeInsets.all(10),
                  child: CircularProgressIndicator(
                    color: Get.isDarkMode ? Colors.white : Colors.black,
                  ),
                )
              : InkWell(
                  onTap: () {
                    newsController.searchNews(searchController.text);
                  },
                  child: const SizedBox(
                    width: 50,
                    height: 50,
                    child: Icon(Icons.search),
                  ),
                )),
        ],
      ),
    );
  }
}
