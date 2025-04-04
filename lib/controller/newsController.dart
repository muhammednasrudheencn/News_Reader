import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:newsreadera/models/newsModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewsController extends GetxController {
  RxList<NewsModel> hotNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYou5List = <NewsModel>[].obs;
  RxList<NewsModel> appleNewsList = <NewsModel>[].obs;
  RxList<NewsModel> appleNews5List = <NewsModel>[].obs;
  RxList<NewsModel> searchNewsList = <NewsModel>[].obs;

  RxBool isHotNewsLoading = false.obs;
  RxBool isNewsForYouLoading = false.obs;
  RxBool isAppleNewsLoading = false.obs;
  RxBool isSearchNewsLoading = false.obs;

  void onInit() async {
    super.onInit();
    getHotNews();
    getNewsForYou();
    getAppleNewsForYou();
  }

  Future<void> getHotNews() async {
    isHotNewsLoading.value = true;
    var hotUri =
        "https://newsapi.org/v2/top-headlines?sources=techcrunch&apiKey=313861df7e844165b44994cfbab834e6";

    try {
      var response = await http.get(Uri.parse(hotUri));
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          hotNewsList.add(NewsModel.fromJson(news));
        }
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
    isHotNewsLoading.value = false;
  }

  Future<void> getNewsForYou() async {
    isNewsForYouLoading.value = true;
    var hotUri =
        "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=313861df7e844165b44994cfbab834e6";

    try {
      var response = await http.get(Uri.parse(hotUri));
      if (response.statusCode == 200) {
        print(response.body);
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          newsForYouList.add(NewsModel.fromJson(news));
        }
        newsForYou5List.value = newsForYouList.sublist(0, 5).obs;
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
    isNewsForYouLoading.value = false;
  }

  Future<void> getAppleNewsForYou() async {
    isAppleNewsLoading.value = true;
    var hotUri =
        "https://newsapi.org/v2/everything?q=apple&from=2025-04-03&to=2025-04-03&sortBy=popularity&apiKey=313861df7e844165b44994cfbab834e6";

    try {
      var response = await http.get(Uri.parse(hotUri));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        for (var news in articals) {
          appleNewsList.add(NewsModel.fromJson(news));
        }
        appleNews5List.value = appleNewsList.sublist(0, 5).obs;
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
    isAppleNewsLoading.value = false;
  }

  Future<void> getSearchNews() async {
    isSearchNewsLoading.value = true;
    var hotUri =
        "https://newsapi.org/v2/everything?q=Latest&apiKey=313861df7e844165b44994cfbab834e6";

    try {
      var response = await http.get(Uri.parse(hotUri));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        int newsCount = 0;
        for (var news in articals) {
          newsCount++;
          searchNewsList.add(NewsModel.fromJson(news));
          if (newsCount == 15) {
            break;
          }
        }
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
    isSearchNewsLoading.value = false;
  }

  Future<void> searchNews(String value) async {
    isNewsForYouLoading.value = true;
    var hotUri =
        "https://newsapi.org/v2/everything?q=$value&apiKey=313861df7e844165b44994cfbab834e6";

    try {
      var response = await http.get(Uri.parse(hotUri));
      if (response.statusCode == 200) {
        var body = jsonDecode(response.body);
        var articals = body["articles"];
        newsForYouList.clear();
        int newscount = 0;
        for (var news in articals) {
          newscount++;
          newsForYouList.add(NewsModel.fromJson(news));
          if (newscount == 20) {
            break;
          }
        }
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
    isNewsForYouLoading.value = false;
  }
}
