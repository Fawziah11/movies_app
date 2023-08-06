import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpComing{
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


  UpComing.non();
  UpComing({
    required this.adult,
    required this.backdrop_path,
    required this.genre_ids,
    required this.id,
    required this.original_language,
    required this.original_title,
    required this.overview,
    required this.popularity,
    required this.poster_path,
    required this.release_date,
    required this.title,
    required this.video,
    required this.vote_average,
    required this.vote_count});

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

  }//fromJson*/

  UpComing.fromJson(Map<String, dynamic> json){
    this.adult= json["adult"];
    this.backdrop_path= json["backdrop_path"];
    this.genre_ids= json["genre_ids"];
    this.id =json['id'];
    this.original_language = json['original_language'];
    this.original_title = json['original_title'];
    this.overview = json['overview'];
    this.popularity = json['popularity'];
    this.poster_path = json['poster_path'];
    this.release_date = json['release_date'];
    this.title= json['title'];
    this.video= json['video'];
    this.vote_average = json['vote_average'];
    this.vote_count = json['vote_count'];
  }//fromJson


  factory UpComing.toJson(Map<String, dynamic> json){
    return UpComing(
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
}//UpComing


/// --------------------- Up Coming Movies ----------------------------------------------------------------------------------------------------------
class UpComingMovies with ChangeNotifier{
  List<UpComing>? UpComingMoviesList;

  String url = "https://api.themoviedb.org/3/movie/upcoming?api_key=a9b7be92d31761e20b30ce366842ce03&language=en-US";

  //this methode fetch all upComing movies data
    Future<List<UpComing>> fetchUpComingMovies() async{
    final response = await http.get(Uri.parse(url));
    try{
      if(response.statusCode == 200){
        //print(response.body);
        var body = json.decode(response.body);
        var newBody = body["results"]; //Map<String, dynamic>
        print("body of result $newBody");
        final List<UpComing> upComingDate = [];
        for(var item in newBody){
          print(UpComing.fromJson(item));
          upComingDate.add(UpComing.fromJson(item));
          print(UpComing.fromJson(item));
        }//end of For
        print(upComingDate);
        notifyListeners();
        return upComingDate;
      }// end of "if"
      else
      { throw Exception("Faild");}//else
      }//end of try

     catch(error){
      rethrow;
     }//catch
}//fetchUpComingMovies()


/*  Future<dynaamic> getMovieTitel async{
     final response = await http.get(Uri.parse("$url/$id"));
}*/

}