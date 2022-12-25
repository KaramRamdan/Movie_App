import 'package:flutter/material.dart';
import 'package:movie_app/core/services/services_locator.dart';
import 'package:movie_app/core/utils/app_string.dart';
import 'package:movie_app/movie/presentation/screens/movies_screen.dart';

void main() {
  // SL
  ServicesLocator().init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: AppString.movieTitle,
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Colors.grey.shade900,
      ),
      home: const MoviesScreen(),
    );
  }
}
