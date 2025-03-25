import 'dart:convert';

import 'package:http/http.dart' as http;

import 'package:news_app/model/show_category_model.dart';

class ShowCategoryNews {
  List<ShowCategoryModel> showCategories = [];

  Future<void> getCategoryNews(String categoryName) async {
    print("cccccccccccccccccccccccccccc = > $categoryName");
    String url =
        "http://api.mediastack.com/v1/news?access_key=bdace605b3905aeb20541826f83e9f32&keywords=$categoryName&countries=in";
    var response = await http.get(Uri.parse(url));

    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      showCategories.clear(); // Clear previous data

      jsonData["data"].forEach((element) {
        if (element["description"] != null) {
          ShowCategoryModel showCategoryModel = ShowCategoryModel(
            title: element["title"] ?? "No Title",
            description: element["description"] ?? "No Description",
            urlToImage: element["image"] ?? "",
            // url: element["url"] ?? "",
          );
          print("Image ==> ${element["image"]}");
          showCategories.add(showCategoryModel);
        }
      });

      print("Fetched News: $showCategories");
    } else {
      print("Failed to fetch news: ${jsonData["message"]}");
    }
  }
}
