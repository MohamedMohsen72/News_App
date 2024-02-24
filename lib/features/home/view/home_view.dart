import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:news_app/features/home/view/widget/coustom_listview.dart';
import 'package:news_app/features/profile/profile_page.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:gap/gap.dart';

import 'package:news_app/core/Utils/color.dart';
import 'package:news_app/core/Utils/text_styles.dart';
import 'package:news_app/core/network/local_storage.dart';

import 'package:news_app/features/home/data/News_model.dart';
import 'package:news_app/features/home/view_model/home_cubit.dart';
import 'package:news_app/features/home/view_model/home_states.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  String? name;
  String? path;
  int pageIndex = 0;

  @override
  void initState() {
    super.initState();
    AppLocal.getCachData(AppLocal.NAME_KEY).then((value) => setState(() => name = value));
    AppLocal.getCachData(AppLocal.IMAGE_KEY).then((value) => setState(() => path = value));
    context.read<NewsCubit>().getNewsCategory("general");
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 4,
        child: Scaffold(
          body: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Hello, ${name?.split(' ').first ?? ''}',
                          style: getTextTitle(color: AppColor.primarycolor),
                        ),
                        Text('Have A Nice Day.',
                          style: getTextsmall(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: 33,
                          backgroundColor: AppColor.primarycolor,
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => const ProfilePage(),
                            ));
                          },
                          child: CircleAvatar(
                            radius: 33,
                            backgroundImage: path != null
                                ? FileImage(File(path!))
                                : const AssetImage('assets/person.png') as ImageProvider,
                          ),
                        ),
                      ],
                    )
                  ],
                ),
                const Gap(15),
                BlocBuilder<NewsCubit, NewsHomeStates>(
                  builder: (context, state) {
                    if (state is NewsByCategoryErrorStates) {
                      return Text(state.error);
                    } else if (state is NewsByCategorySuccessStates) {
                      NewsModel news = state.model;
                      return CarouselSlider.builder(
                        itemCount: news.articles?.length ?? 0,
                        itemBuilder: (context, index, realIndex) {
                          var newsItem = news.articles?[index];
                          return Container(width: 320,decoration: BoxDecoration(borderRadius: BorderRadius.circular(18)),
                            child: ClipRRect(borderRadius: BorderRadius.circular(18),child: Image.network(newsItem?.urlToImage ?? '',fit: BoxFit.cover,errorBuilder: (context, error, stackTrace) {
                              return Image.asset('assets/imag5.png');
                            },)),
                          );
                        },
                        options: CarouselOptions(
                          height: 160,
                          aspectRatio: 16 / 9,
                          viewportFraction: 0.8,
                          initialPage: 0,
                          enableInfiniteScroll: true,
                          reverse: false,
                          autoPlay: true,
                          autoPlayInterval: const Duration(seconds: 3),
                          autoPlayAnimationDuration: const Duration(milliseconds: 800),
                          autoPlayCurve: Curves.fastOutSlowIn,
                          enlargeCenterPage: true,
                          enlargeStrategy: CenterPageEnlargeStrategy.scale,
                          onPageChanged: (index, reason) {
                            setState(() {
                              pageIndex = index;
                            });
                          },
                          scrollDirection: Axis.horizontal,
                        ),
                      );
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
                const Gap(8),
                SmoothPageIndicator(
                  controller: PageController(initialPage: pageIndex),
                  count: 6,
                  effect: ScrollingDotsEffect(
                    dotHeight: 7,
                    dotWidth: 10,
                    activeDotColor: AppColor.primarycolor,
                  ),
                  onDotClicked: (index) {},
                ),
                const Gap(10),
                ButtonsTabBar(
                  backgroundColor: AppColor.primarycolor,
                  borderWidth: 2,
                  borderColor: Colors.black,
                  labelStyle: getTextbady(color: Colors.black),
                  unselectedLabelStyle: getTextbady(),
                  height: 55,
                  unselectedBackgroundColor: AppColor.Colorcon,
                  contentPadding: const EdgeInsets.symmetric(horizontal: 15),
                  tabs: const [
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
                    children: const [
                      Listview(category: 'science'),
                      Listview(category: 'entertainment'),
                      Listview(category: 'sports'),
                      Listview(category: 'business'),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
