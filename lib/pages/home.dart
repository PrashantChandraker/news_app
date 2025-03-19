import 'package:flutter/material.dart';
import 'package:news_app/Utils/appColors.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/pages/category_list_tile.dart';
import 'package:news_app/pages/hottest_news_box.dart';
import 'package:news_app/services/data.dart';
import 'package:news_app/widgets/dynamic_text.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<CategoryModel> categories = [];

  @override
  void initState() {
    categories = getCategories();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightWhiteColor,
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
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
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: const [
                  HottestNewsBox(),
                  HottestNewsBox(),
                  HottestNewsBox(),
                  HottestNewsBox(),
                ],
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
          ],
        ),
      ),
    );
  }
}
