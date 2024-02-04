import 'package:flutter/material.dart';

Widget slider4(
    List firstlistname, String categorytitle, String type, int itemcount) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: EdgeInsets.only(left: 10.0, top: 15, bottom: 10),
        child: Text(categorytitle.toString()),
      ),
      Container(
        height: 1750,
        width: 1000,
        child: ListView.builder(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: itemcount,
          itemBuilder: (context, index) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://image.tmdb.org/t/p/w500${firstlistname[index]['poster_path']}'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    margin: EdgeInsets.only(left: 1, bottom: 10, right: 1),
                    width: 400,
                    height: 200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.black.withOpacity(0.4),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: Padding(
                            padding: EdgeInsets.only(
                                top: 2, bottom: 2, left: 5, right: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                Icon(Icons.star, color: Colors.amberAccent),
                                Text(firstlistname[index]['vote_average']
                                    .toString()),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(8),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                                          Text(
                        firstlistname[index]['origin_country'].toString(),
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                        SizedBox(width: 10,),
                       Text(
                        firstlistname[index]['original_language'].toString(),
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),SizedBox(width: 10,),

                      Text(
                        firstlistname[index]['first_air_date'].toString(),
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                        SizedBox(width: 80,),
                          IconButton(onPressed: (){}, icon: Icon(Icons.share)),
                          IconButton(
                              onPressed: () {},
                              icon: Icon(
                                Icons.add,
                                size: 35,
                              )),
                              IconButton(onPressed: (){}, icon:Icon(Icons.play_arrow,size: 35,) )
                        ],
                      ),
                          
                      Text(
                        firstlistname[index]['overview'].toString(),
                        style: TextStyle(
                          color: const Color.fromARGB(255, 255, 255, 255),
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          },
        ),
      ),
    ],
  );
}
