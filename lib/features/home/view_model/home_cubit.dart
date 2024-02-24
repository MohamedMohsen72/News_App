import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/services/api_services.dart';
import 'package:news_app/features/home/view_model/home_states.dart';

class NewsCubit extends Cubit<NewsHomeStates> {
  NewsCubit() : super(NewsInitStates());
  //getCategory
  getNewsCategory(String category) {
    emit(NewsByCategoryLoadingStates());
    try {
      ApiServices.getnewsbycategory(category).then((value) {

        emit(NewsByCategorySuccessStates(model: value!));
      });
    } catch (e) {
      emit(NewsByCategoryErrorStates(error: e.toString()));
    }
  }
  //getsearch
  getNewsSearch(String search) {
    emit(NewsBysearchLoadingStates());
    try {
      ApiServices.getnewsbysearch(search).then((value) {

        emit(NewsBysearchSuccessStates(model: value!));
      });
    } catch (e) {
      emit(NewsBysearchErrorStates(error: e.toString()));
    }
  }
  //getsources
  getNewssources(String sourcename) {
    emit(NewsBysourcesLoadingStates());
    try {
      ApiServices.getnewsbysources(sourcename).then((value) {

        emit(NewsBysourcesSuccessStates(model: value!));
      });
    } catch (e) {
      emit(NewsBysourcesErrorStates(error: e.toString()));
    }
  }

}
