import 'package:flutter/material.dart';
import 'package:news_app/Utils/appColors.dart';
import 'package:news_app/model/category_model.dart';
import 'package:news_app/pages/category_list_tile.dart';
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
                children: [
                  hottest_news_box(context),
                  hottest_news_box(context),
                  hottest_news_box(context),
                  hottest_news_box(context),
                ],
              ),
            ),
            SizedBox(
              height: 15,
            ),
            DynamicText(
              text: "Explore",
              textSize: 20,
              textWeight: FontWeight.w900,
            ),
            SizedBox(
              height: 5,
            ),
            Expanded(
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
            )
          ],
        ),
      ),
    );
  }

  Container hottest_news_box(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
      child: Material(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)),
        elevation: 5,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
                bottomLeft: Radius.circular(10)),
            color: AppColors.primaryBlue,
            // borderRadius: BorderRadius.circular(100),
          ),
          child: Column(
            children: [
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.asset(
                  "assets/demo_news.jpeg",
                  width: MediaQuery.of(context).size.width / 1.9,
                  fit: BoxFit.cover,
                  height: 200,
                ),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                width: MediaQuery.of(context).size.width / 1.8,
                child: DynamicText(
                  text: "Please subscribe to PNews's channel",
                  textSize: 14,
                  textWeight: FontWeight.bold,
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                width: MediaQuery.of(context).size.width / 1.8,
                child: DynamicText(
                  text: "Loreum ipsum is simply dummmy text of printing",
                  textSize: 12,
                  textWeight: FontWeight.normal,
                ),
              ),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 2.2,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: AppColors.lightWhiteColor,
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(15),
                      ),
                    ),
                    width: MediaQuery.of(context).size.width / 7,
                    child: const Icon(
                      Icons.arrow_right_alt,
                      size: 35,
                      color: Colors.black,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
