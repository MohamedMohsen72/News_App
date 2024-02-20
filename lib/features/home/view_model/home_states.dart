import 'package:news_app/features/home/data/News_model.dart';

class NewsHomeStates{}

class NewsInitStates extends NewsHomeStates{}

class NewsByCategoryLoadingStates extends NewsHomeStates{}
class NewsByCategorySuccessStates extends NewsHomeStates{
  final NewsModel model;
  NewsByCategorySuccessStates( {required this.model});
}
class NewsByCategoryErrorStates extends NewsHomeStates{
  String error;
  NewsByCategoryErrorStates({required this.error});
}