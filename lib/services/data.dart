import 'package:news_app/model/category_model.dart';

List<CategoryModel> getCategories() {
  return [
    CategoryModel(categoryName: "Business", image: "assets/bussiness_box.jpeg"),
    CategoryModel(
        categoryName: "Entertainment", image: "assets/entertainment.jpeg"),
    CategoryModel(categoryName: "Science", image: "assets/science.jpeg"),
    CategoryModel(categoryName: "Sports", image: "assets/sports.jpeg"),
    CategoryModel(categoryName: "Technology", image: "assets/technology.jpeg"),
  ];
}
