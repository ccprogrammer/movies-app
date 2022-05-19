import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:movies_app/constants.dart';
import 'package:movies_app/pages/main_page/favorite_page.dart';
import 'package:movies_app/pages/main_page/home_page.dart';
import 'package:movies_app/pages/search/search_movie_page.dart';
import 'package:movies_app/provider/search_movie_provider.dart';
import 'package:provider/provider.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _currentIndex = 0;

  List<String> navIcon = [
    'assets/icon_home.png',
    'assets/icon_favorite.png',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButton: _buildFAB(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: _buildBottomNavigation(),
      body: _buildBody(currentIndex: _currentIndex),
    );
  }

  Widget _buildBottomNavigation() {
    return AnimatedBottomNavigationBar.builder(
      itemCount: navIcon.length,
      tabBuilder: (int index, bool isActive) {
        final color = isActive ? Const.colorBlue : Colors.white30;
        return Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              navIcon[index],
              width: 24,
              height: 24,
              color: color,
            ),
          ],
        );
      },
      activeIndex: _currentIndex,
      gapLocation: GapLocation.center,
      notchSmoothness: NotchSmoothness.smoothEdge,
      leftCornerRadius: 24,
      rightCornerRadius: 24,
      backgroundColor: Const.colorPrimary,
      splashRadius: 0,
      onTap: (index) => setState(() => _currentIndex = index),
    );
  }

  Widget _buildBody({currentIndex}) {
    switch (currentIndex) {
      case 0:
        return HomePage();
      case 1:
        return FavoriteMovies();

      default:
        return HomePage();
    }
  }

  Widget _buildFAB() {
    return Consumer<SearchedMoviesProvider>(
      builder: (context, data, child) {
        return OpenContainer(
          closedShape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(50),
            ),
          ),
          closedColor: Const.colorIndicator,
          openColor: Const.colorPrimary,
          transitionDuration: Duration(milliseconds: 500),
          closedBuilder: (context, action) => FloatingActionButton(
            elevation: 0,
            onPressed: () {
              action();
            },
            child: Image.asset(
              'assets/icon_search.png',
              width: 24,
              height: 24,
            ),
            backgroundColor: Const.colorIndicator,
          ),
          openBuilder: (context, action) => SearchMoviePage(),
        );
      },
    );
  }
}
