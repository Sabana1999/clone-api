import 'dart:convert';

import 'package:clone/hime_page.dart/api_links/api_link.dart';
import 'package:clone/hime_page.dart/homep/section/movies.dart';
import 'package:clone/hime_page.dart/homep/section/tv_series.dart';
import 'package:clone/hime_page.dart/homep/section/tv_shows.dart';
import 'package:clone/hime_page.dart/homep/section/upcoming.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:carousel_slider/carousel_slider.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage>with TickerProviderStateMixin {
  List<Map<String, dynamic>> airinglist = [];
  Future<void> airingtoday() async {
    var airing = await http.get(Uri.parse(airing_today));

    if (airing.statusCode == 200) {
      var tempdata = jsonDecode(airing.body);
      var airingjson = tempdata['results'];
      for (var i = 0; i < airingjson.length; i++) {
        airinglist.add({
          'id': airingjson[i]['id'],
          'poster_path': airingjson[i]['poster_path'],
          'vote_average': airingjson[i]['vote_average'],
          'origin_country': airingjson[i]['origin_country'],
          'indexno': i,
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 4, vsync: this);
    return Scaffold(
        //  appBar: AppBar(),
        body: CustomScrollView(
      slivers: [
        SliverAppBar(
          toolbarHeight: 60,
          pinned: true,
          expandedHeight: MediaQuery.of(context).size.height * 0.5,
          flexibleSpace: FlexibleSpaceBar(
            collapseMode: CollapseMode.parallax,
            background: FutureBuilder(
                future: airingtoday(),
                builder: ((context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    return CarouselSlider(
                      options: CarouselOptions(
                        viewportFraction: 1,
                        autoPlay: true,
                        autoPlayInterval: Duration(seconds: 2),
                        height: MediaQuery.of(context).size.height,
                      ),
                      items: airinglist.map((i) {
                        return Builder(builder: (BuildContext) {
                          return GestureDetector(
                            onTap: () {},
                            child: GestureDetector(
                              onTap: () {},
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    image: DecorationImage(
                                        colorFilter: ColorFilter.mode(
                                            Colors.black.withOpacity(0.3),
                                            BlendMode.darken),
                                        image: NetworkImage(
                                            'https://image.tmdb.org/t/p/w500${i['poster_path']}'
                                            ),
                                        fit: BoxFit.fill)),
                              ),
                            ),
                          );
                        });
                      }).toList(),
                    );
                  } else {
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.grey,
                      ),
                    );
                  }
                })),
          ),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Airing-Today ' + '🔥',
                style: TextStyle(
                    color: Colors.white.withOpacity(0.8), fontSize: 16),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
        ),
        SliverList(
            delegate: SliverChildListDelegate([
          Center(
            child: Text(''),
          ),
          Container(height: 45,
          width: MediaQuery.of(context).size.width,
          child: TabBar(
            controller: _tabController,
            physics: BouncingScrollPhysics(),
            labelPadding: EdgeInsets.symmetric(horizontal: 25),
            isScrollable: true,
            indicator: BoxDecoration(borderRadius: BorderRadius.circular(30),
            color: Colors.redAccent.withOpacity(0.4)),
            tabs: [
              Tab(child: Text('Movie'),),
              Tab(child: Text('Tv-Series'),
              ),
              Tab(child: Text('Tv-shows'),),
              Tab(child: Text('UpComing'),)
          ]),
          ),
          Container(
            height: 2050,
            child: TabBarView(
              controller: _tabController,
              children:[
                Movies(),
                TvSeries(),
                TvShows(),
                UpComing(),
              ] 
            
              ),
          )
        ]
        )
        )
      ],
    ));
  }
}
