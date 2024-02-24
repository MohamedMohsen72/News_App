import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/Utils/color.dart';
import 'package:news_app/core/Utils/text_styles.dart';
import 'package:news_app/features/home/data/News_model.dart';
import 'package:news_app/features/home/view_model/home_cubit.dart';
import 'package:news_app/features/home/view_model/home_states.dart';
import 'package:news_app/features/source/source_detalis_view.dart';
import 'package:news_app/features/source/source_page.dart';

class NewsSorceView extends StatelessWidget {
  const NewsSorceView({
    super.key,
    required this.sourcename,
    required this.title,
  });
  final String sourcename;
  final String title;
  @override
  Widget build(BuildContext context) {
    context.read<NewsCubit>().getNewssources(sourcename);
    return Scaffold(
      appBar: AppBar(
        title: Text(title, style: getTextTitle()),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios, color: AppColor.whiteColor),
          onPressed: () {
           Navigator.of(context).pop();

          },
        ),
      ),
      body: BlocBuilder<NewsCubit, NewsHomeStates>(
        builder: (context, state) {
          if (state is NewsBysourcesErrorStates) {
            return Text(state.error);
          } else if (state is NewsBysourcesSuccessStates) {
            NewsModel news = state.model;
            return Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text(
                        'Total Results : ${news.articles?.length}',
                        style: getTextTitle(),
                      ),
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: news.articles?.length,
                      itemBuilder: (context, index) {
                        var newsitem = news.articles?[index];
                        return Padding(
                          padding: const EdgeInsets.symmetric(vertical: 15),
                          child: GestureDetector(
                            onTap: () {
                              Navigator.of(context)
                                  .pushReplacement(MaterialPageRoute(
                                builder: (context) => SourceDetailsView(
                                  model: newsitem,
                                ),
                              ));
                            },
                            child: Container(
                                decoration: BoxDecoration(
                                  color: AppColor.Colorcon,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Row(
                                  children: [
                                    ClipRRect(
                                      borderRadius: BorderRadius.circular(15),
                                      child: Image.network(
                                        newsitem!.urlToImage ?? '',
                                        width: 180,
                                        height: 130,
                                        fit: BoxFit.fill,
                                        errorBuilder:
                                            (context, error, stackTrace) {
                                          return const SizedBox(
                                              width: 170,
                                              child: Icon(
                                                Icons.error,
                                              ));
                                        },
                                      ),
                                    ),
                                    const Gap(10),
                                    Expanded(
                                      child: Column(
                                        children: [
                                          Text(
                                            newsitem.title ?? '',
                                            style: getTextbady(fontSize: 16),
                                          ),
                                          const Gap(10),
                                          Row(
                                            children: [
                                              const Icon(
                                                Icons.menu,
                                                color: Colors.white,
                                              ),
                                              const Gap(5),
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
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
