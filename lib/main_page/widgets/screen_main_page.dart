import 'package:flutter/material.dart';
import 'package:netflix_clone/presentation/downloads/widgets/bottom_nav.dart';
import 'package:netflix_clone/presentation/downloads/widgets/screen_downloads.dart';
import 'package:netflix_clone/presentation/fast_lagh/screen_fast_lagh.dart';
import 'package:netflix_clone/presentation/home/screen_home.dart';
import 'package:netflix_clone/presentation/new_and_hot/screen_new_and_hot.dart';
import 'package:netflix_clone/presentation/search/widgets/screen_search.dart';

class screenmainPage extends StatelessWidget {
   screenmainPage({super.key});

  final _pages = [
    
    HomeScreen(),
    HotAndNewScreen(),
    ScreenFastLaugh(),
    SearchScreen(),
    ScreenDownloads()

  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
     body: SafeArea(
       child: ValueListenableBuilder(
        valueListenable: IndexChangeNotifire,
        builder: (context, int index, _) {
          return _pages[index];
         
       },),
     ),
          bottomNavigationBar: bottomNavigationWidget(),
    );
  }
}