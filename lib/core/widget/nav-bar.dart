import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:news_app/core/Utils/color.dart';
import 'package:news_app/features/home/view/home_view.dart';
import 'package:news_app/features/source/source_page.dart';

import 'package:news_app/features/profile/profile_page.dart';
import 'package:news_app/features/search/search_page.dart';

class NavBar extends StatefulWidget {
  const NavBar({super.key});

  @override
  State<NavBar> createState() => _NavBarState();
}

class _NavBarState extends State<NavBar> {
  int index = 0;
  List<Widget> Screens = [
    HomeView(),
    SearchPage(),
    SourcePage(),
    ProfilePage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Screens[index],
      bottomNavigationBar: BottomNavigationBar(
          currentIndex: index,
          onTap: (value) {
            setState(() {
              index = value;
            });
          },
          items: [
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/Vector.svg', width: 25),
                activeIcon: SvgPicture.asset('assets/Vector.svg',
                    width: 25,
                    colorFilter: ColorFilter.mode(
                        AppColor.primarycolor, BlendMode.srcIn)),
                label: " "),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/iconamoon_search-duotone.svg',
                    width: 25),
                activeIcon: SvgPicture.asset(
                    'assets/iconamoon_search-duotone.svg',
                    width: 25,
                    colorFilter: ColorFilter.mode(
                        AppColor.primarycolor, BlendMode.srcIn)),
                label: " "),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/solar_folder-bold-duotone.svg',
                    width: 25),
                activeIcon: SvgPicture.asset(
                    'assets/solar_folder-bold-duotone.svg',
                    width: 25,
                    colorFilter: ColorFilter.mode(
                        AppColor.primarycolor, BlendMode.srcIn)),
                label: " "),
            BottomNavigationBarItem(
                icon: SvgPicture.asset('assets/Profile.svg', width: 25),
                activeIcon: SvgPicture.asset('assets/Profile.svg',
                    width: 25,
                    colorFilter: ColorFilter.mode(
                        AppColor.primarycolor, BlendMode.srcIn)),
                label: " "),
          ]),
    );
  }
}
