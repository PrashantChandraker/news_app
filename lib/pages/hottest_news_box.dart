import 'package:flutter/material.dart';
import 'package:news_app/Utils/appColors.dart';
import 'package:news_app/widgets/dynamic_text.dart';

class HottestNewsBox extends StatelessWidget {
  const HottestNewsBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.fromLTRB(5, 5, 5, 5),
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
