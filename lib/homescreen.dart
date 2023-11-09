import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movieapp/api/api.dart';
import 'package:movieapp/colors.dart';
import 'package:movieapp/screens/Tv_page.dart';
import 'package:movieapp/screens/popular%20page.dart';
import 'package:movieapp/widgets/abc.dart';
import 'package:movieapp/widgets/movieslider.dart';
import 'package:movieapp/widgets/trending%20slider.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'models/movie.dart';

class Homescreen extends StatefulWidget {
  const Homescreen({Key? key}) : super(key: key);

  @override
  State<Homescreen> createState() => _HomescreenState();
}

class _HomescreenState extends State<Homescreen> {
  late Future<List<Movie>> discoverMovies;
  late Future<List<Movie>> topRatedMovies;
  late Future<List<Movie>> upComingMovies;
  late Future<List<Movie>> tvEpisodes;
  late Future<List<Movie>> populars;

  @override
  initState() {
    super.initState();
    discoverMovies = Api().getDiscoverMovies();
    topRatedMovies = Api().getTopRatedMovies();
    upComingMovies = Api().getUpcomingMovies();
    tvEpisodes = Api().getTvEpisodes();
    populars = Api().getPopular();

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colours.scaffoldBgcolor,
      appBar: AppBar(

          backgroundColor: Colors.transparent,
          elevation: 0,
          title: Center(
              child: Image.asset(
            "lib/images/img.png",
            fit: BoxFit.cover,
            height: 40,
            filterQuality: FilterQuality.high,
          ))),
      drawer: Drawer(

        backgroundColor: Colours.scaffoldBgcolor,
        child: ListView(
          children: [
            DrawerHeader(
                child:Container(
                  decoration: BoxDecoration(
                    image:  DecorationImage(
            image: AssetImage("lib/images/img.png"),
                    ),
                    borderRadius: BorderRadius.circular(5)
                  ),
                )

            ),
          FutureBuilder(future: tvEpisodes, builder: (context, snapshot) {
            final Tvepisode = snapshot.data;
            return ListTile(
              leading: Icon(Icons.tv),
              title: Text("Tv Episodes",style: TextStyle(fontSize: 20),),
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) =>Tv(TvEpisode: Tvepisode) ,));
              },
            );
          }),
            SizedBox(
              height: 5,
            ),
            FutureBuilder(future: populars, builder: (context, snapshot) {
              final popularmovies = snapshot.data;
              print(popularmovies);
              return ListTile(
                leading: Icon(Icons.trending_up),
                title: Text("Popular ",style: TextStyle(fontSize: 20),),
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context) =>Popular (PopularEpisode:popularmovies),));
                },
              );
            },)
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Discover Movies", style: GoogleFonts.aBeeZee(fontSize: 25)),
              SizedBox(
                height: 32,
              ),
              //create a class

              FutureBuilder<List<Movie>>(
                future: discoverMovies,
                builder: (context, snapshot) {
                  final movieList = snapshot.data;

                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      // Handle error
                      return Text("Error: ${snapshot.error}");
                    }

                    return TrendingSlider(
                      Discovermovies: movieList,
                    );
                  } else {
                    // Show a loading indicator or placeholder widget
                    return Skeletonizer(
                        enabled: true,
                        child: LoadingSkelton());
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "Top Rated Movies",
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 32,
              ),

              FutureBuilder<List<Movie>>(
                future: topRatedMovies,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      // Handle error
                      return Text("Error: ${snapshot.error}");
                    }
                    final topRatedMovies = snapshot.data;
                    return Movieslider(
                      TopratedMovies: topRatedMovies,
                    );
                  } else {
                    // Show a loading indicator or placeholder widget
                    return LoadingSkelton();
                  }
                },
              ),
              SizedBox(
                height: 32,
              ),
              Text(
                "upcoming Movies",
                style: GoogleFonts.aBeeZee(
                  fontSize: 25,
                ),
              ),
              SizedBox(
                height: 32,
              ),

              FutureBuilder<List<Movie>>(
                future: upComingMovies,
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.done) {
                    if (snapshot.hasError) {
                      // Handle error
                      return Text("Error: ${snapshot.error}");
                    }
                    final upcomingmovies = snapshot.data;
                    return Movieslider(
                      TopratedMovies: upcomingmovies,
                    );
                  } else {
                    // Show a loading indicator or placeholder widget
                    return LoadingSkelton();
                  }
                },
              ),
              SizedBox(
                height: 10,
              ),

              SizedBox(
                height: 10,
              ),
              //
              // FutureBuilder<List<Movie>>(
              //   future: tvEpisodes,
              //   builder: (context, snapshot) {
              //     if (snapshot.connectionState == ConnectionState.done) {
              //       if (snapshot.hasError) {
              //         // Handle error
              //         return Text("Error: ${snapshot.error}");
              //       }
              //       final tvEpisodes = snapshot.data;
              //       return Movieslider(
              //         TopratedMovies: tvEpisodes,
              //       );
              //     } else {
              //       // Show a loading indicator or placeholder widget
              //       return LoadingSkelton();
              //     }
              //   },
              // ),



            ],
          ),
        ),
      ),
    );
  }
}
