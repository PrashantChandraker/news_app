import 'package:flutter/material.dart';
import 'package:news_app/Utils/appColors.dart';
import 'package:news_app/widgets/dynamic_text.dart';

class HottestNewsBox extends StatelessWidget {
  final String? articleImage;
  final String? articleDescription;
  final String? articleTitle;
  HottestNewsBox(
      {super.key,
      this.articleImage,
      this.articleDescription,
      this.articleTitle});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(10),
            topRight: Radius.circular(10),
            bottomLeft: Radius.circular(10)),
      ),
      margin: const EdgeInsets.fromLTRB(5, 2, 5, 5),
      child: Container(
        margin: const EdgeInsets.fromLTRB(3, 3, 3, 3),
        decoration: BoxDecoration(
          border: Border.all(width: 2),
          boxShadow: [BoxShadow(color: Colors.black, offset: Offset(2, 2))],
          borderRadius: const BorderRadius.only(
              topLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              bottomLeft: Radius.circular(10)),
          color: AppColors.lightWhiteColor,
        ),
        child: Column(
          children: [
            const SizedBox(
              height: 5,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: (articleImage!.isEmpty || articleImage == null)
                  ? Image.asset(
                      "assets/no_pictures.png",
                      width: MediaQuery.of(context).size.width / 1.75,
                      fit: BoxFit.cover,
                      height: 200,
                    )
                  : Image.network(
                      articleImage!,
                      width: MediaQuery.of(context).size.width / 1.75,
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
                lines: 2,
                overflow: TextOverflow.ellipsis,
                text: articleTitle,
                textSize: 14,
                textWeight: FontWeight.bold,
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 5.0),
              width: MediaQuery.of(context).size.width / 1.8,
              child: DynamicText(
                text: articleDescription,
                lines: 3,
                overflow: TextOverflow.ellipsis,
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
                    border: Border(left: BorderSide(), top: BorderSide()),
                    color: AppColors.primaryBlue,
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
    );
  }
}
