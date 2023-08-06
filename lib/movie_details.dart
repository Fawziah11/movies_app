import 'package:flutter/material.dart';
import 'package:movies_app/favorite.dart';


class MovieDetails extends StatefulWidget {
  static const routName = "movieDetails";
  final int index;
  final List movieDetailList;
   const MovieDetails( this.index, this.movieDetailList);


  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  static bool favorite = false;
  final List favoriteList= [];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Theme.of(context).primaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      fit: BoxFit.fill,
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500' +
                                widget.movieDetailList[widget.index]['poster_path'])
                    )),
               //widget.movieDetailList[widget.index]['backdrop_path']
                height: 500,
              ),
              SizedBox(height: 20,),
              Text(widget.movieDetailList[widget.index]['original_title'],style: TextStyle(fontSize: 25 ,color: Theme.of(context).accentColor, fontWeight: FontWeight.bold) , textAlign: TextAlign.center,),
              SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(widget.movieDetailList[widget.index]['overview'],style: TextStyle(fontSize: 18 ,color: Colors.white,) , textAlign: TextAlign.center,),
              ),
              SizedBox(height: 15,),
              /*Text("Cast",style: TextStyle(fontSize: 25 ,color: Theme.of(context).accentColor, fontWeight: FontWeight.bold) , textAlign: TextAlign.center,),
              Container(
                height: 150,
                child: Row(
                  children: [
                    Expanded(
                      child: ListView(
                        padding: EdgeInsets.all(25),
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          Container(
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                            width: 150,
                            height: 200,
                          ),
                          const SizedBox(width: 15),
                          Container(
                            width: 150,
                            height: 200,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                          ),
                          SizedBox(width: 15),
                          Container(
                            width: 150,
                            height: 200,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                          ),
                          const SizedBox(width: 15),
                          Container(
                            width: 150,
                            height: 200,
                            decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              color: Colors.white,
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),*/
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.white,
          child: Icon(Icons.favorite, size: 30, color:favorite == false?  Colors.black: Theme.of(context).accentColor),
          onPressed: (){
            setState(() {
              favorite =! favorite;
             // FavoriteList(widget.movieDetailList);
              if (favorite == true)
              {
                favoriteList.add(widget.movieDetailList[widget.index]);
                //favoriteList.insert(widget.index, widget.movieDetailList);
              }
              print(favoriteList);
            });
          },
        ),
      ),
    );
  }
}
