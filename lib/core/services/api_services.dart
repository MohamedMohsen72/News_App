import 'package:dio/dio.dart';
import 'package:news_app/core/constants/app_constant.dart';
import 'package:news_app/features/home/data/News_model.dart';

class ApiServices {
 static Future<NewsModel?> getnewsbycategory() async {
    try {
      var res = await Dio()
          .get('${Appconstant.url}country=us&&apiKey=${Appconstant.apikay}');
      if (res.statusCode == 200) {
        NewsModel news = NewsModel.fromJson(res.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
