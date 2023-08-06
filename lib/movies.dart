import 'package:flutter/material.dart';
import 'package:movies_app/movie_details.dart';
import 'package:tmdb_api/tmdb_api.dart';


class Movies extends StatefulWidget {
  static const routName = "movies";
  const Movies({Key? key}) : super(key: key);

  @override
  State<Movies> createState() => _MoviesState();
}

class _MoviesState extends State<Movies> {

  List allMovies = [];
  List moviesGenres =[];
  List allMoviesGenres = [];

  final String apiKey = 'a9b7be92d31761e20b30ce366842ce03';
  final readAccessTocken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOWI3YmU5MmQzMTc2MWUyMGIzMGNlMzY2ODQyY2UwMyIsInN1YiI6IjYzYTRkYWQ1NWYyYjhkMDcyM2ViYTJjYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VXpkdcgGzoWyG1tMytIgANPRQk9jWU9jCVpONBndIUI';

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessTocken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map allMoviesResult = await tmdbWithCustomLogs.v3.movies.getPopular();
    Map moviesGenresResult = await tmdbWithCustomLogs.v3.genres.getMovieList();
    //Map allMoviesGenresResult = await tmdbWithCustomLogs.v3.movies.getPopular();
    // print(trendingResult);
    setState(() {
      allMovies = allMoviesResult['results'];
      moviesGenres = moviesGenresResult['genres'];
    //  allMoviesGenres = allMovies["genre_ids"];
    });
  }

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List moviesType = moviesGenres;
    //print(allMovies);
    //print(moviesType);
    //print(allMoviesGenres);
  //  print(moviesGenres);
    /*
    ["Action", "Adventure", "Comedy", "Drama",
      "Fantasy","Horror","Musical", "Mystery",
      "Romance","Science Fiction", "Sports"];*/



    return DefaultTabController(
      length: moviesType.length,
      child: Column(
       children: [
          TabBar(
              isScrollable: true,
             // labelStyle: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
              tabs:[
                ...moviesType.map((e) => Tab(text: e['name'])).toList()
                ]
          ),
         Expanded(
             child: TabBarView(
               children: [
                 ...moviesType.map((tab) {
                   return  ListView.builder(
                       primary: false,
                       scrollDirection: Axis.vertical,
                       shrinkWrap: true,
                       itemCount: moviesType.length,
                       itemBuilder: (context, index) => (
                           Container(
                            // child: Text("this is ${moviesType[index]['name']} , ${moviesType[index]['id']}, ${allMovies[index]["genre_ids"][0]} ", style: TextStyle(color: Colors.red),),
                           )
                       // 28 == [27,9648,53]
                           //(moviesType[index]['id'] == allMovies.where((element) => element['id']== moviesType[index]['id']))?

                      /* for( int i =0; i<moviesType.length, i++){
                         for (int j =0; j<allMovies.length, j++){
                           if (i==j){
                             return Container(
                               child: Text("this is ${moviesType[index]['name']} , ${moviesType[index]['id']}, ${allMovies[index]["genre_ids"][0]} ", style: TextStyle(color: Colors.red),),
                             )
                             }
                           else
                            return  SizedBox()
                         }
                   }*/

                          /*(moviesType[index]['id'] == allMovies[index]["genre_ids"][0])?
                            Container(

                             child: Text("this is ${moviesType[index]['name']} , ${moviesType[index]['id']}, ${allMovies[index]["genre_ids"][0]} ", style: TextStyle(color: Colors.red),),
                           )
                           : SizedBox()*/
                     /* Container(
                             child: Text("this is ${allMovies[index]["genre_ids"][0]}", style: TextStyle(color: Colors.red),),
                           )*/

                   )
                   );
                 }).toList(),
               ],
             )

         )
        ],
      ),
    );
  }
}
