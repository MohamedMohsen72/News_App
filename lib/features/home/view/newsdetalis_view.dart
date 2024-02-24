import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/Utils/color.dart';
import 'package:news_app/core/Utils/text_styles.dart';
import 'package:news_app/core/widget/custom_btm.dart';

import 'package:news_app/features/home/data/Articles.dart';

import 'package:url_launcher/url_launcher.dart';

class NewsDetailsView extends StatelessWidget {
  const NewsDetailsView({super.key, required this.model});
  final Articles model;
  Future<void> _launchUrl() async {
    if (!await launchUrl(Uri.parse(model.url ?? ""))) {
      throw Exception('Could not launch ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20),
        child: customBottom(
            text: 'Go To Website',
            onPressed: () {
              _launchUrl();
            },
            background: AppColor.primarycolor,
            foreground: Colors.black),
      ),
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            icon: Icon(
              Icons.arrow_back_ios,
              color: AppColor.whiteColor,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: Image.network(
                model.urlToImage ??"",
                errorBuilder: (context, error, stackTrace) {
                  return Container(
                      width: 300,
                      child: const Icon(
                        Icons.error,
                      ));
                },
              ),
            ),
            const Gap(10),
            Text(
              model.title ?? "",
              style: getTextTitle(),
            ),
            const Gap(15),
            Row(
              children: [
                Text(
                  model.author ?? "",
                  style: getTextbady(),
                ),
              ],
            ),
            const Gap(10),
            Row(
              children: [
                Text(
                  model.publishedAt?.split('T')[0] ?? "",
                  style: getTextsmall(),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
