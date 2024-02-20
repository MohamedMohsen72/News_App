import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/core/Utils/color.dart';
import 'package:news_app/features/home/view_model/home_cubit.dart';
import 'package:news_app/features/splash_view.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => NewsCubit(),

      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            bottomNavigationBarTheme: BottomNavigationBarThemeData(
                type: BottomNavigationBarType.fixed,
                selectedItemColor: AppColor.primarycolor,
                unselectedItemColor: AppColor.greyColor,
                showSelectedLabels: false,
                showUnselectedLabels: false,
                backgroundColor: AppColor.balckColor),
            appBarTheme: AppBarTheme(backgroundColor: AppColor.balckColor),
            scaffoldBackgroundColor: AppColor.balckColor,),
        home: SplashVeiw(),
      ),
    );
  }
}
