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


class NewsBysearchLoadingStates extends NewsHomeStates{}
class NewsBysearchSuccessStates extends NewsHomeStates{
  final NewsModel model;
  NewsBysearchSuccessStates( {required this.model});
}
class NewsBysearchErrorStates extends NewsHomeStates{
  String error;
  NewsBysearchErrorStates({required this.error});
}
//getsources
class NewsBysourcesLoadingStates extends NewsHomeStates{}
class NewsBysourcesSuccessStates extends NewsHomeStates{
  final NewsModel model;
  NewsBysourcesSuccessStates( {required this.model});
}
class NewsBysourcesErrorStates extends NewsHomeStates{
  String error;
  NewsBysourcesErrorStates({required this.error});
}