import 'package:flutter/material.dart';
import 'package:news_app/Utils/appColors.dart';
import 'package:news_app/widgets/dynamic_text.dart';

class CategoryListTile extends StatelessWidget {
  final image;
  final categoryName;
  const CategoryListTile({super.key, this.image, this.categoryName});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10),
      child: Stack(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(60),
            child: Image.asset(
              image,
              height: 120,
              width: 120,
              fit: BoxFit.cover,
            ),
          ),
          (categoryName == "Science" || categoryName == "Sports")
              ? const SizedBox()
              : Container(
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      color: AppColors.shadowBlack),
                ),
          Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: const Offset(4, 4),
                    blurRadius: 4,
                  ),
                ],
                border: Border.all(width: 4, color: AppColors.shadowBlack),
                borderRadius: BorderRadius.circular(60)),
            child: Center(
              child: DynamicText(
                text: (categoryName == "Science" || categoryName == "Sports")
                    ? ""
                    : categoryName,
                textSize: categoryName == "Entertainment" ? 14 : 16,
                textColor: Colors.white,
                textWeight: FontWeight.w900,
              ),
            ),
          )
        ],
      ),
    );
  }
}
