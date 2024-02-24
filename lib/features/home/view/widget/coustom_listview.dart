import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:news_app/core/Utils/color.dart';
import 'package:news_app/core/Utils/text_styles.dart';
import 'package:news_app/features/home/data/News_model.dart';
import 'package:news_app/features/home/view/newsdetalis_view.dart';
import 'package:news_app/features/home/view_model/home_cubit.dart';
import 'package:news_app/features/home/view_model/home_states.dart';

class Listview extends StatefulWidget {
  const Listview({super.key, required this.category});
  final String category;

  @override
  State<Listview> createState() => _ListviewState();
}

class _ListviewState extends State<Listview> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    context.read<NewsCubit>().getNewsCategory(widget.category);
  }

  @override
  Widget build(BuildContext context) {
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
                child: GestureDetector(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => NewsDetailsView(model: newsitem),
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
                              width: 180,height: 130,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                    width: 170,
                                    child: const Icon(
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
                                  newsitem!.title ?? '',
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
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
