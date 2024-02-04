import 'dart:convert';

import 'package:clone/hime_page.dart/api/apikey.dart';
import 'package:clone/hime_page.dart/function/fun4.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class EveryOne extends StatefulWidget {
  const EveryOne({super.key});

  @override
  State<EveryOne> createState() => _TvSeriesState();
}

class _TvSeriesState extends State<EveryOne> {
 
  List<Map<String, dynamic>> airingtoday = [];

  var airing_today = 'https://api.themoviedb.org/3/movie/popular?api_key=$api';
  
  Future<void> tvseriesfn() async {
  


    

    var airingseriesresp = await http.get(Uri.parse(airing_today));

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
           "overview" :popularjson[i]["overview"],
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
            return SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [

                   slider4(airingtoday, "", "tv", 20),
                ],
              ),
            );
          }
        });
  }
}
