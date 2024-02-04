import 'dart:convert';

import 'package:clone/hime_page.dart/api/apikey.dart';
import 'package:clone/hime_page.dart/function/fun4.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Games1 extends StatefulWidget {
  const Games1({super.key});

  @override
  State<Games1> createState() => _TvSeriesState();
}

class _TvSeriesState extends State<Games1> {
  List<Map<String, dynamic>> populartvseries = [];

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
          "overview":popularjson[i]["overview"],
          "first_air_date":popularjson[i]["first_air_date"],
          "origin_country":popularjson[i]["origin_country"],
        });
      }
    } else {
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
                  slider4(populartvseries, "", "tv", 20),

                ],
              ),
            );
          }
        });
  }
}
