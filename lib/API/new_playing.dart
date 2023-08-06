/*
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class NewPlaying{
  late bool? adult;
  late String? backdrop_path;
  late List? genre_ids;
  late int? id;
  late String? original_language;
  late String? original_title;
  late String?  overview;
  late double? popularity;
  late String? poster_path;
  late String? release_date;
  late String? title;
  late bool video;
  late num? vote_average;
  late int? vote_count;

  //final UpComing? upComing;

  NewPlaying.non();
  NewPlaying({required this.adult, required this.backdrop_path, required this.genre_ids, required this.id, required this.original_language, required this.original_title, required this.overview, required this.popularity, required this.poster_path, required this.release_date,required this.title,required this.video, required this.vote_average, required this.vote_count});

*/
/*  factory UpComing.fromJson(Map<String, dynamic> json){
    return UpComing(
        adult: json["adult"],
        backdrop_path: json["backdrop_path"],
        genre_ids: json["genre_ids"],
        id: json['id'],
        original_language: json['original_language'],
        original_title: json['original_title'],
        overview: json['overview'],
        popularity: json['popularity'],
        poster_path: json['poster_path'],
        release_date: json['release_date'],
        title: json['title'],
        video: json['video'],
        vote_average: json['vote_average'],
        vote_count: json['vote_count']);

  }//fromJson*//*


  NewPlaying.fromJson(Map<String, dynamic> json){
    adult= json["adult"];
    backdrop_path= json["backdrop_path"];
    genre_ids= json["genre_ids"];
    id =json['id'];
    original_language = json['original_language'];
    original_title = json['original_title'];
    overview = json['overview'];
    popularity = json['popularity'];
    poster_path = json['poster_path'];
    release_date = json['release_date'];
    title= json['title'];
    video= json['video'];
    vote_average = json['vote_average'];
    vote_count = json['vote_count'];
  }//fromJson


  factory NewPlaying.toJson(Map<String, dynamic> json){
    return NewPlaying(
      adult: json['adult'],
      backdrop_path: json['backdrop_path'],
      genre_ids: json['genre_ids'],
      id: json['id'],
      original_language: json['original_language'],
      original_title: json['original_title'],
      overview: json['overview'],
      popularity: json['popularity'],
      poster_path: json['poster_path'],
      release_date: json['release_date'],
      title: json['title'],
      video: json['video'],
      vote_average: json['vote_average'],
      vote_count: json['vote_count'],
    );
  }//toJson
}//NewPlaying

/// -------------------------------------------------------------------------------------------------------------------------------
class NewPlayingMovies with ChangeNotifier{
  List<NewPlaying>? newPlayingMoviesList;

  String url = "https://api.themoviedb.org/3/movie/now_playing?api_key=a9b7be92d31761e20b30ce366842ce03&language=en-US";

  //this methode fetch all NewPlaying movies data
  Future<List<NewPlaying>> fetchNewPlayingMovies() async{
    final response = await http.get(Uri.parse(url));
    try{
      if(response.statusCode == 200){
        //print(response.body);
        var body = json.decode(response.body);
        var newBady = body["results"];
        print("body of result ${newBady}");
        final List<NewPlaying> newPlayingDate = [];
        for(var item in newBady){
          newPlayingDate.add(NewPlaying.fromJson(item));
        }//end of For
        notifyListeners();
        print(newPlayingDate);
        return newPlayingDate;
      }// end of "if"
      else
      { throw Exception("Faild");}//else
    }//end of try

    catch(error){
      rethrow;
    }//catch
  }//fetchUpComingMovies()


*/
/*  Future<dynaamic> getMovieTitel async{
     final response = await http.get(Uri.parse("$url/$id"));
}*//*


}
*/
