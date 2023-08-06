import 'package:flutter/material.dart';

class FavoriteList {
  final List movies;

  const FavoriteList(this.movies);

  allFavoriteLis(){
    List moviesFavoriteLis = [];
    moviesFavoriteLis.add(this.movies);

    return moviesFavoriteLis;
  }

  //List favMovieList = [];

}

class Favorite  extends StatefulWidget {
  static const routName = "favorite";
  final List moviesFavoriteLis;
  const Favorite(this.moviesFavoriteLis);

  @override
  State<Favorite> createState() => _FavoriteState();
}

class _FavoriteState extends State<Favorite> {

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Column(
        children: [
          Text("Favorite",style: TextStyle(fontSize: 30 ,color: Colors.white,) , textAlign: TextAlign.center,),
         /* Padding(
            padding: const EdgeInsets.all(20),
            child: GestureDetector(
              onTap: (){},
              child: Column(
                children: [
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    height: 200,
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(30)),
                      color: Colors.white,
                    ),
                  ),
                ],
              )
              ),
          ),*/
        ],
         ),
    );
  }
}
