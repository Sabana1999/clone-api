import 'dart:convert';

import 'package:clone/hime_page.dart/api/apikey.dart';
import 'package:clone/hime_page.dart/function/fun.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class UpComing extends StatefulWidget {
  const UpComing({super.key});

  @override
  State<UpComing> createState() => _TvSeriesState();
}

class _TvSeriesState extends State<UpComing> {
  List<Map<String, dynamic>> populartvseries = [];
  List<Map<String, dynamic>> topratesseries = [];
  List<Map<String, dynamic>> upcomingseries = [];
  List<Map<String, dynamic>> airingtoday = [];

  var airing_today = 'https://api.themoviedb.org/3/tv/top_rated?api_key=$api';
  
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

   
    var airingseriesresp = await http.get(Uri.parse(upcomingurl));

    if (airingseriesresp.statusCode == 200) {
      var tempdata = jsonDecode(airingseriesresp.body);
      var popularjson = tempdata['results'];
      for (var i = 0; i < popularjson.length; i++) {
        airingtoday.add({
          "title": popularjson[i]["title"],
          "poster_path": popularjson[i]["poster_path"],
          "vote_average": popularjson[i]["vote_average"],
          "release_date": popularjson[i]["release_date"],
          "original_language": popularjson[i]["original_language"],
          "id": popularjson[i]["id"],
        });
      }
    }

    var upcomingseriesresp = await http.get(Uri.parse(upcomingurl));

    if (upcomingseriesresp.statusCode == 200) {
      var tempdata = jsonDecode(upcomingseriesresp.body);
      var popularjson = tempdata['results'];
      for (var i = 0; i < popularjson.length; i++) {
        upcomingseries.add({
          "title": popularjson[i]["title"],
          "poster_path": popularjson[i]["poster_path"],
          "vote_average": popularjson[i]["vote_average"],
          "release_date": popularjson[i]["release_date"],
          "original_language": popularjson[i]["original_language"],
          "id": popularjson[i]["id"],
        });
      }
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
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                slider(airingtoday, "Airing Today tv", "tv", 20),
               // slider(topratesseries, "Top-rated tv series", "tv", 20),
                //slider(upcomingseries, "Upcoming tv series", "tv", 20),
                
              ],
            );
          }
        });
  }
}
