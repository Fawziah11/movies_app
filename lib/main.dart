import 'package:flutter/material.dart';
import 'package:movies_app/favorite.dart';
import 'package:movies_app/home.dart';
import 'package:movies_app/movie_details.dart';
import 'package:movies_app/movies.dart';
import 'package:movies_app/tabScreen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Movies app',
      theme: ThemeData(
        primaryColor: Color.fromARGB(255, 23, 27, 33),
        accentColor: Color.fromARGB(255, 89, 196, 170)
      ),
      initialRoute: TabScreen.routName,
      routes: {
        TabScreen.routName : (context) => TabScreen(),
        HomePage.routName : (context) => HomePage(),
        Movies.routName : (context) => Movies(),
        Favorite.routName : (context) => Favorite([]),
        MovieDetails.routName : (context) => MovieDetails( 0, []),
      },
    );
  }
}