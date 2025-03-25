import 'package:flutter/material.dart';
import 'package:news_app/Utils/appColors.dart';
import 'package:news_app/model/article_model.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/pages/explore/category_list_tile.dart';
import 'package:news_app/pages/hottest_news/hottest_news_box.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/services/news.dart';
import 'package:news_app/widgets/dynamic_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool loading = true;
  List<CategoryModel> categories = [];
  List<ArticleModel> articles = [];
  @override
  void initState() {
    getTheNews();
    categories = getCategories();
    super.initState();
  }

  getTheNews() async {
    News newsClass = News();
    await newsClass.getNews();
    articles = newsClass.news;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightWhiteColor,
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  DynamicText(
                    text: "Buzz",
                    textColor: AppColors.primaryBlue,
                    textSize: 24,
                    textWeight: FontWeight.w900,
                  ),
                  DynamicText(
                    text: "Line",
                    textColor: Colors.black,
                    textSize: 24,
                    textWeight: FontWeight.w900,
                  ),
                ],
              ),
              TextFormField(
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {}, icon: Icon(Icons.search_rounded)),
                  border: OutlineInputBorder(),
                  hintText: "Type Keyword to search",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              DynamicText(
                text: "Hottest News",
                textSize: 20,
                textWeight: FontWeight.w900,
              ),
              Container(
                height: MediaQuery.of(context).size.height / 2.4,
                child: ListView.builder(
                  shrinkWrap: true,
                  physics: ClampingScrollPhysics(),
                  scrollDirection: Axis.horizontal,
                  itemCount: articles.length,
                  itemBuilder: (context, index) {
                    print(articles);
                    return HottestNewsBox(
                      articleTitle: articles[index].title,
                      articleDescription: articles[index].description,
                      articleImage: articles[index].urlToImage,
                    );
                  },
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              DynamicText(
                text: "Explore",
                textSize: 20,
                textWeight: FontWeight.w900,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                height: 130,
                // color: Colors.amber,
                child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: categories.length,
                    itemBuilder: (context, index) {
                      return CategoryListTile(
                        image: categories[index].image,
                        categoryName: categories[index].categoryName,
                      );
                    }),
              ),
              DynamicText(
                text: "Trending News",
                textSize: 20,
                textWeight: FontWeight.w900,
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                margin: EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  color: AppColors.lightWhiteColor,
                  border: Border.all(color: Colors.grey),
                  borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      bottomLeft: Radius.circular(15),
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(15),
                          bottomLeft: Radius.circular(15)),
                      child: Image.asset(
                        "assets/daily_news.jpeg",
                        height: 120,
                        width: 120,
                      ),
                    ),
                    Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
                          width: MediaQuery.of(context).size.width / 1.7,
                          child: DynamicText(
                            text: "Please subscribe to PNews's",
                            alignment: TextAlign.center,
                            textSize: 14,
                            textWeight: FontWeight.bold,
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10.0),
                          width: MediaQuery.of(context).size.width / 1.7,
                          child: DynamicText(
                            text:
                                "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a prashant",
                            textSize: 12,
                            lines: 5,
                            alignment: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                            textWeight: FontWeight.normal,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
