import 'package:dio/dio.dart';
import 'package:news_app/core/constants/app_constant.dart';
import 'package:news_app/features/home/data/News_model.dart';

class ApiServices {
 static Future<NewsModel?> getnewsbycategory(String category) async {
    try {
      var res = await Dio()
          .get('${Appconstant.url}country=us&category=$category&apiKey=${Appconstant.apikay}');
      if (res.statusCode == 200) {
        NewsModel news = NewsModel.fromJson(res.data);
        return news;
      }
    } catch (e) {
      print(e.toString());
    }
  }
 static Future<NewsModel?> getnewsbysearch(String search) async {
   try {
     var res = await Dio()
         .get('${Appconstant.url}country=us&q=$search&apiKey=${Appconstant.apikay}');
     if (res.statusCode == 200) {
       NewsModel news = NewsModel.fromJson(res.data);
       return news;
     }
   } catch (e) {
     print(e.toString());
   }
 }
 static Future<NewsModel?> getnewsbysources(sourcename) async {
   try {
     var res = await Dio()
         .get(
         '${Appconstant.url}sources=$sourcename&apiKey=${Appconstant.apikay}');
     if (res.statusCode == 200) {
       NewsModel news = NewsModel.fromJson(res.data);
       return news;
     } else {
       return null;
     }
   } catch (e) {
     print(e.toString());
     return null;
   }
 }


}
