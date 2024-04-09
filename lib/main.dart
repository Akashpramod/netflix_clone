import 'package:flutter/material.dart';
import 'package:netflix_clone/core/colours/colors.dart';
import 'package:netflix_clone/main_page/widgets/screen_main_page.dart';
import 'package:netflix_clone/presentation/home/splash.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'flutter demo',
      theme: ThemeData(
        scaffoldBackgroundColor: backgroundColor,

        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          bodyText2: TextStyle(color: Colors.white)
        ), colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue).copyWith(background: Colors.black)
      ),
      home: SplashScreen(child: screenmainPage(),),
      
    );
  }
}
