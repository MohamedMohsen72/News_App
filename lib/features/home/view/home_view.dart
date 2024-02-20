import 'dart:io';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/core/Utils/color.dart';
import 'package:news_app/core/Utils/text_styles.dart';
import 'package:news_app/core/network/local_storage.dart';
import 'package:news_app/core/widget/coustom_listview.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? name;
  String? path;
  int pageindex = 0;
  @override
  void initState() {
    AppLocal.getCachData(AppLocal.NAME_KEY).then((value) => name = value);
    AppLocal.getCachData(AppLocal.IMAGE_KEY).then((value) => path = value);
    super.initState();
  }

  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(children: [
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Hello,${name?.split(' ').first}',
                        style: getTextTitle(color: AppColor.primarycolor)),
                    Text('Have A Nice Day.',
                        style: getTextsmall(fontWeight: FontWeight.bold)),
                  ],
                ),
                Stack(
                  alignment: Alignment.center,
                  children: [
                    CircleAvatar(
                      radius: 37,
                      backgroundColor: AppColor.primarycolor,
                    ),
                    GestureDetector(
                      onTap: () {
                        // Navigator.of(context).push(MaterialPageRoute(
                        // builder: (context) => const DataUser(),
                        // ));
                      },
                      child: CircleAvatar(
                          radius: 37,
                          backgroundImage: path != null
                              ? FileImage(File(path!)) as ImageProvider
                              : const AssetImage('assets/person.png')),
                    ),
                  ],
                )
              ]),
              Gap(15),
              CarouselSlider.builder(
                  itemCount: 5,
                  itemBuilder: (BuildContext context, int itemIndex,
                          int pageViewIndex) =>
                      Container(
                        child: Image.asset('assets/image 2.png'),
                      ),
                  options: CarouselOptions(
                    height: 160,
                    aspectRatio: 16 / 9,
                    viewportFraction: 0.8,
                    initialPage: 0,
                    enableInfiniteScroll: true,
                    reverse: false,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 3),
                    autoPlayAnimationDuration: Duration(milliseconds: 800),
                    autoPlayCurve: Curves.fastOutSlowIn,
                    enlargeCenterPage: true,
                    enlargeFactor: 0.3,
                    onPageChanged: (index, reason) {
                      setState(() {
                        pageindex = index;
                      });
                    },
                    scrollDirection: Axis.horizontal,
                  )),
              Gap(8),
              SmoothPageIndicator(
                  controller:
                      PageController(initialPage: pageindex), // PageController
                  count: 6,
                  effect: ScrollingDotsEffect(
                      dotHeight: 10,
                      dotWidth: 10,
                      activeDotColor:
                          AppColor.primarycolor), // your preferred effect
                  onDotClicked: (index) {}),
              Gap(10),
              ButtonsTabBar(
                // Customize the appearance and behavior of the tab bar
                backgroundColor: AppColor.primarycolor,
                borderWidth: 2,
                borderColor: Colors.black,
                labelStyle: getTextbady(color: Colors.black),
                unselectedLabelStyle: getTextbady(),
                height: 55,
                unselectedBackgroundColor: AppColor.Colorcon,
                contentPadding: EdgeInsets.symmetric(horizontal: 15),
                // Add your tabs here
                tabs: [
                  Tab(
                    text: 'Science',
                  ),
                  Tab(
                    text: 'Entertainment',
                  ),
                  Tab(
                    text: 'Sports',
                  ),
                  Tab(
                    text: 'Business',
                  ),
                ],
              ),
              Expanded(
                  child: TabBarView(
                children: [
                  Listview(),
                  Listview(),
                  Listview(),
                  Listview(),
                ],
              ))
            ]),
          ),
        ),
      ),
    );
  }
}
