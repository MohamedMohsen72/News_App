import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/Utils/color.dart';
import 'package:news_app/core/Utils/text_styles.dart';
import 'package:news_app/features/home/data/News_model.dart';
import 'package:news_app/features/home/view_model/home_cubit.dart';
import 'package:news_app/features/home/view_model/home_states.dart';

class Listview extends StatelessWidget {
  const Listview({super.key});

  @override
  Widget build(BuildContext context) {
    context.read<NewsCubit>().getNewsCategory();
    return BlocBuilder<NewsCubit, NewsHomeStates>(
      builder: (context, state) {
        if (state is NewsByCategoryErrorStates) {
          return Text(state.error);
        } else if (state is NewsByCategorySuccessStates) {
          NewsModel news = state.model;
          return ListView.builder(
            itemCount: news.articles?.length,
            itemBuilder: (context, index) {
              var newsitem = news.articles?[index];
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Container(
                    decoration: BoxDecoration(
                      color: AppColor.Colorcon,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: Row(
                      children: [
                        Image.asset(
                          'assets/image 1.png',
                          width: 170,
                          fit: BoxFit.cover,
                        ),
                        Gap(10),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                newsitem!.title ?? '',
                                style: getTextbady(fontSize: 16),
                              ),
                              Gap(10),
                              Row(
                                children: [
                                  Icon(
                                    Icons.menu,
                                    color: Colors.white,
                                  ),
                                  Gap(5),
                                  Text(
                                    'READ',
                                    style: getTextsmall(
                                      color: Colors.white,
                                    ),
                                  )
                                ],
                              )
                            ],
                          ),
                        )
                      ],
                    )),
              );
            },
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
