import 'package:flutter/material.dart';

import 'package:news_app/core/Utils/color.dart';
import 'package:news_app/core/Utils/text_styles.dart';

import 'package:news_app/features/source/news_sorce_view.dart';

class CustomGridView extends StatelessWidget {
  const CustomGridView({super.key, required this.source, required this.website});
final String source;
  final String website;
  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(MaterialPageRoute(builder: (context) => NewsSorceView (sourcename: website, title: source,),));
      },
      child: Container(

        padding: const EdgeInsets.all(8),

        decoration: BoxDecoration(
            color: AppColor.Colorcon,
            borderRadius: BorderRadius.circular(20)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Image.asset('assets/image 3.png',
                fit: BoxFit.cover, width: double.infinity),
            Text(source,style: getTextbady(),)
          ],
        ),
      ),
    );
  }
}
