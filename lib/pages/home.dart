import 'package:flutter/material.dart';
import 'package:news_app/Utils/appColors.dart';
import 'package:news_app/widgets/dynamicText.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightWhiteColor,
      body: Container(
        margin: const EdgeInsets.only(top: 50),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                DynamicText(
                  text: "Buzz",
                  textColor: AppColors.primaryBlue,
                  textSize: 22,
                  textWeight: FontWeight.w900,
                ),
                DynamicText(
                  text: "Line",
                  textColor: Colors.black,
                  textSize: 22,
                  textWeight: FontWeight.w900,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
