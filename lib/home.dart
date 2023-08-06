import 'package:flutter/material.dart';
import 'package:movies_app/movie_details.dart';
import 'package:tmdb_api/tmdb_api.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  static const routName = "home";

  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List trendingMovies = [];
  List topRatedMovies = [];
  List upComingMovies = [];
  List newPlayedMovies = [];
  List tv = [];
  final String apiKey = 'a9b7be92d31761e20b30ce366842ce03';
  final readAccessTocken =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJhOWI3YmU5MmQzMTc2MWUyMGIzMGNlMzY2ODQyY2UwMyIsInN1YiI6IjYzYTRkYWQ1NWYyYjhkMDcyM2ViYTJjYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.VXpkdcgGzoWyG1tMytIgANPRQk9jWU9jCVpONBndIUI';

  loadMovies() async {
    TMDB tmdbWithCustomLogs = TMDB(ApiKeys(apiKey, readAccessTocken),
        logConfig: ConfigLogger(showLogs: true, showErrorLogs: true));

    Map trendingResult = await tmdbWithCustomLogs.v3.trending.getTrending();
    Map topRatedResult = await tmdbWithCustomLogs.v3.movies.getTopRated();
    Map tvResult = await tmdbWithCustomLogs.v3.tv.getPopular();
    Map upComingResult = await tmdbWithCustomLogs.v3.movies.getUpcoming();
    Map newPlayedResult = await tmdbWithCustomLogs.v3.movies.getNowPlaying();

    // print(trendingResult);
    setState(() {
      trendingMovies = trendingResult['results'];
      topRatedMovies = topRatedResult['results'];
      upComingMovies = upComingResult['results'];
      //upComingMovies = upComingResult['results'];
      newPlayedMovies = newPlayedResult['results'];
      tv = tvResult['results'];
    });
  }

  @override
  void initState() {
    loadMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [

          /// ------------------------- New Played Movies ------------------------------------------------------------
          Container(
            height: 450,
            child: ListView(
              children: [
                CarouselSlider.builder(
                  itemCount: newPlayedMovies.length,
                  itemBuilder: (context, index, _) {
                    return (newPlayedMovies.isEmpty)? Text("", style: TextStyle(fontSize: 30),):
                      Container(
                          //height: double.infinity,
                          width: double.infinity,
                          //margin: EdgeInsets.symmetric(horizontal: 10),
                          child: Image.network('http://image.tmdb.org/t/p/w500' + newPlayedMovies[index]['poster_path'],fit: BoxFit.fill, )
                    );
                  },
                  options: CarouselOptions(
                    height: 450,
                    initialPage: 0,
                    enlargeCenterPage: true,
                    autoPlay: true,
                    autoPlayInterval: Duration(seconds: 2),
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          /// ------------------------- UpComing Movies ------------------------------------------------------------
          const Text("UpComing",  style: TextStyle( color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 350,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: upComingMovies.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            //Navigator.of(context).pushNamed(MovieDetails.routName);
                            print(upComingMovies);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(index, upComingMovies)));
                          },
                          child: Container(
                            width: 140,
                            height: 300,
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              'https://image.tmdb.org/t/p/w500' +
                                                  upComingMovies[index]
                                                      ['poster_path'])
                                      )),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    upComingMovies[index]['title'] != null
                                        ? upComingMovies[index]['title']
                                        : 'loading',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          ),
          SizedBox(
            height: 20,
          ),

          /// ------------------------- Trending Movies ------------------------------------------------------------
          const Text(
            "Trending",
            style: TextStyle(
                color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold),
          ),
          Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.all(10),
                  height: 350,
                  child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: trendingMovies.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                          onTap: () {
                            //Navigator.of(context).pushNamed(MovieDetails.routName);
                            Navigator.push(context, MaterialPageRoute(builder: (context) => MovieDetails(index, trendingMovies)));
                          },
                          child: Container(
                            width: 140,
                            height: 300,
                            child: Column(
                              children: [
                                Container(
                                  height: 200,
                                  decoration: BoxDecoration(
                                      image: DecorationImage(
                                          image: NetworkImage('https://image.tmdb.org/t/p/w500' + trendingMovies[index]['poster_path']))),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(15),
                                  child: Text(
                                    trendingMovies[index]['title'] != null
                                        ? trendingMovies[index]['title']
                                        : 'loading',
                                    style: TextStyle(
                                        fontSize: 15, color: Colors.white),
                                  ),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
