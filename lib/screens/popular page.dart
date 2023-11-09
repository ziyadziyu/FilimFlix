import 'package:flutter/material.dart';

import 'package:movieapp/colors.dart';


import '../models/movie.dart';
import 'detail_screen.dart';

class Popular extends StatelessWidget {
  final List<Movie>? PopularEpisode;

  Popular({super.key, required this.PopularEpisode});

  @override
  Widget build(BuildContext context) {
    print(PopularEpisode);
    return Scaffold(
      backgroundColor: Colours.scaffoldBgcolor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Center(child: Image.asset("lib/images/img.png")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PopularEpisode != null ?  ListView.builder(
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemCount: PopularEpisode!.length,
            itemBuilder: (context, index) {
              final movie = PopularEpisode![index].posterPath;
              return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(
                            movie: PopularEpisode![index],
                          ),

                        ),
                      );
                    },
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(12),
                      child: Column(
                        children: [
                          Container(
                            height: 300,
                            width: 200,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: NetworkImage(
                                  'https://image.tmdb.org/t/p/original${movie}',
                                ),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ));
            }) :
            Center(child: Text("hbyyy"),)
      ),
    );
  }
}