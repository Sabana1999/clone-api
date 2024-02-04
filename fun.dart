import 'package:flutter/material.dart';

Widget slider(List firstlistname,String categorytitle,String type,int itemcount){
  return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 10.0, top: 15, bottom: 40),
                  child: Text(categorytitle.toString()),
                ),
                Container(
                  height: 250,
                  child: ListView.builder(
                      physics: BouncingScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemCount: itemcount,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://image.tmdb.org/t/p/w500${firstlistname[index]['poster_path']}'),
                                    fit: BoxFit.cover)),
                            margin: EdgeInsets.only(left: 13),
                            width: 170,
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.end,
                              
                              // children: [
                              //   Padding(padding: EdgeInsets.only(top: 2,left: 6),
                              //   child: Text(populartvseries[index]['release_date']),),
                              //   Padding(padding: EdgeInsets.only(top: 2,right: 6))
                              // ],
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.4),
                                    borderRadius:BorderRadius.circular(5),
                                     
                                  ),
                                  child: Padding(padding: EdgeInsets.only(
                                    top: 2,
                                    bottom: 2,
                                    left: 5,
                                    right: 5,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.star,color:Colors.amberAccent,),
                                      Text(firstlistname[index]['vote_average'].toString()),
                                    ],
                                  ),),
                                )
                              ],
                            ),
                          ),
                        );
                      }),
                )
              ],
            );
}