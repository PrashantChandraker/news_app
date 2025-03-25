import 'dart:convert';
import 'package:news_app/model/article_model.dart';
import 'package:http/http.dart' as http;

class News {
  List<ArticleModel> news = [];

  Future<void> getNews() async {
    String url =
        "http://api.mediastack.com/v1/news?access_key=bdace605b3905aeb20541826f83e9f32&keywords=trending&countries=in";

    var response = await http.get(Uri.parse(url));
    var jsonData = jsonDecode(response.body);

    if (response.statusCode == 200) {
      news.clear(); // Clear previous data

      jsonData["data"].forEach((element) {
        if (element["description"] != null) {
          ArticleModel articleModel = ArticleModel(
            title: element["title"] ?? "No Title",
            description: element["description"] ?? "No Description",
            urlToImage: element["image"] ?? "",
            // url: element["url"] ?? "",
          );
          print("Image ==> ${element["image"]}");
          news.add(articleModel);
        }
      });

      print("Fetched News: $news");
    } else {
      print("Failed to fetch news: ${jsonData["message"]}");
    }
  }
}
