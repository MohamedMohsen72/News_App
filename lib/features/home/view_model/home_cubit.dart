import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/services/api_services.dart';
import 'package:news_app/features/home/view_model/home_states.dart';

class NewsCubit extends Cubit<NewsHomeStates> {
  NewsCubit() : super(NewsInitStates());
  getNewsCategory() {
    emit(NewsByCategoryLoadingStates());
    try {
      ApiServices.getnewsbycategory().then((value) {

        emit(NewsByCategorySuccessStates(model: value!));
      });
    } catch (e) {
      emit(NewsByCategoryErrorStates(error: e.toString()));
    }
  }
}
