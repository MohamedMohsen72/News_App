import 'package:flutter/material.dart';
import 'package:news_app/core/Utils/color.dart';
import 'package:news_app/core/Utils/text_styles.dart';
import 'package:news_app/core/widget/nav-bar.dart';
import 'package:news_app/features/source/widget/continer_gridview.dart';
class SourcePage extends StatelessWidget {
  const SourcePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sources', style: getTextTitle()),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColor.whiteColor),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => const NavBar(),
            ));
          },
        ),
      ),
      body: Column(children: [
        Expanded(
          child: GridView.count(
            primary: false,
            padding: const EdgeInsets.all(20),
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            crossAxisCount: 2,
            children: const <Widget>[
              CustomGridView(
                source: 'BBC NEWS',
                website: 'bbc-news',
              ),
              CustomGridView(
                source: 'SKY NEWS',
                website: 'Al Jazeera English',
              ),
              CustomGridView(
                source: 'ESPN NEWS',
                website: 'cbs-news',
              ),
              CustomGridView(
                source: 'CNN NEWS',
                website: 'cnn',
              ),
              CustomGridView(
                source: 'BBC NEWS',
                website: 'al-jazeera-english',
              ),
              CustomGridView(
                source: 'BBC NEWS',
                website: 'ary-news',
              ),
            ],
          ),
        )
      ]),
    );
  }
}
