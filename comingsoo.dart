import 'dart:convert';

import 'package:clone/hime_page.dart/api/apikey.dart';
import 'package:clone/hime_page.dart/function/fun.dart';
import 'package:clone/hime_page.dart/function/fun4.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ComingSoon extends StatefulWidget {
  const ComingSoon({super.key});

  @override
  State<ComingSoon> createState() => _TvSeriesState();
}

class _TvSeriesState extends State<ComingSoon> {
  List<Map<String, dynamic>> populartvseries = [];
  List<Map<String, dynamic>> topratesseries = [];
  List<Map<String, dynamic>> upcomingseries = [];
  List<Map<String, dynamic>> airingtoday = [];

  var airing_today = 'https://api.themoviedb.org/3/movie/popular?api_key=$api';
  var top_ratedurl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=$api';
  var upcomingurl = 'https://api.themoviedb.org/3/movie/upcoming?api_key=$api';
  var popularurl = 'https://api.themoviedb.org/3/tv/airing_today?api_key=$api';

  Future<void> tvseriesfn() async {
    var populartvseriesresp = await http.get(Uri.parse(popularurl));

    if (populartvseriesresp.statusCode == 200) {
      var tempdata = jsonDecode(populartvseriesresp.body);
      var popularjson = tempdata['results'];
      for (var i = 0; i < popularjson.length; i++) {
        populartvseries.add({
          "title": popularjson[i]["title"],
          "poster_path": popularjson[i]["poster_path"],
          "vote_average": popularjson[i]["vote_average"],
          "release_date": popularjson[i]["release_date"],
          "original_language": popularjson[i]["original_language"],
          "id": popularjson[i]["id"],
        });
      }
    } else {
      print(populartvseriesresp.statusCode);
    }

    var topratedtvseriesresp = await http.get(Uri.parse(top_ratedurl));

    if (topratedtvseriesresp.statusCode == 200) {
      var tempdata = jsonDecode(topratedtvseriesresp.body);
      var popularjson = tempdata['results'];
      for (var i = 0; i < popularjson.length; i++) {
        topratesseries.add({
          "title": popularjson[i]["title"],
          "poster_path": popularjson[i]["poster_path"],
          "vote_average": popularjson[i]["vote_average"],
          "release_date": popularjson[i]["release_date"],
          "original_language": popularjson[i]["original_language"],
          "overview": popularjson[i]["overview"],
          "id": popularjson[i]["id"],
        });
      }
    }else {
      print(populartvseriesresp.statusCode);
    }

   

    
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: tvseriesfn(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(
                color: Colors.redAccent,
              ),
            );
          } else {
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  slider4(topratesseries, "", "tv", 20),

                ],
              ),
            );
          }
        });
  }
}
