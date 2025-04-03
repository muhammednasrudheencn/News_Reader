import 'dart:convert';
import 'package:newsreadera/models/newsModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class NewsController extends GetxController {
  RxList<NewsModel> hotNewsList = <NewsModel>[].obs;
  RxList<NewsModel> newsForYouList = <NewsModel>[].obs;

  void onInit() async {
    super.onInit();
    getHotNews();
    getNewsForYou();
  }

  Future<void> getHotNews() async {
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
  }

  Future<void> getNewsForYou() async {
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
      } else {
        print("Something went Wrong in Tranding News");
      }
    } catch (ex) {
      print(ex);
    }
  }
}
