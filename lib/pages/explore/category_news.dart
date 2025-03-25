import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/Utils/appColors.dart';
import 'package:news_app/model/show_category_model.dart';
import 'package:news_app/services/show_category_news.dart';
import 'package:news_app/widgets/dynamic_text.dart';

class CategoryNews extends StatefulWidget {
  final String categoryName;
  const CategoryNews({super.key, required this.categoryName});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool loading = true;

  @override
  void initState() {
    print("categoryName => ${widget.categoryName}");
    getTheNews();
    super.initState();
  }

  getTheNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoryNews(widget.categoryName.toLowerCase());
    categories = showCategoryNews.showCategories;
    setState(() {
      loading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryBlue,
      body: Container(
        margin: const EdgeInsets.fromLTRB(0, 50, 0, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(
                  width: 15,
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back_ios_new)),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 5,
                ),
                DynamicText(
                  text: widget.categoryName,
                  textWeight: FontWeight.w900,
                  textSize: 30,
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: Container(
                // height: medi,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: AppColors.lightWhiteColor,
                ),
                child: Container(
                    margin: EdgeInsets.fromLTRB(5, 5, 5, 5),
                    decoration: BoxDecoration(
                      color: Colors.yellow.shade100,
                      border: Border.all(
                        width: 2,
                      ),
                    ),
                    child: loading
                        ? CupertinoActivityIndicator(
                            radius: 30,
                          )
                        : ListView.builder(
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemCount: categories.length,
                            itemBuilder: (context, index) {
                              return Column(
                                children: [
                                  (categories[index].urlToImage!.isEmpty ||
                                          categories[index].urlToImage == null)
                                      ? Image.asset(
                                          "assets/no_pictures.png",
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.5,
                                          fit: BoxFit.cover,
                                          height: 250,
                                        )
                                      : Image.network(
                                          categories[index].urlToImage!,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          fit: BoxFit.cover,
                                          height: 250,
                                        ),
                                  Container(
                                    decoration: BoxDecoration(),
                                    padding:
                                        const EdgeInsets.fromLTRB(5, 5, 5, 0),
                                    width: MediaQuery.of(context).size.width,
                                    child: DynamicText(
                                      text: categories[index].title,
                                      textSize: 20,
                                      textWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Container(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    width: MediaQuery.of(context).size.width,
                                    child: DynamicText(
                                      text: categories[index].description,
                                      textSize: 14,

                                      // overflow: TextOverflow.ellipsis,
                                      textWeight: FontWeight.normal,
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  )
                                ],
                              );
                            },
                          )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
