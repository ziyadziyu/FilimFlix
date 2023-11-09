

class Movie {
  String title;
  String backDropPath;
  String orginalTitle;
  String overview;
  String posterPath;
  String releaseDate;
  String medaitype;
  double votgeeAverge;

  Movie({
    required this.title,
    required this.backDropPath,
    required this.orginalTitle,
    required this.overview,
    required this.posterPath,
    required this.releaseDate,
    required this.medaitype,
    required this.votgeeAverge,
  });

  factory Movie.fromJson(Map<String, dynamic>json){
    return Movie(
        title: json["title"]?? "",
        backDropPath: json["backdrop_path"]?? "",
        orginalTitle: json["original_title"]?? "",
        overview: json["overview"]?? "",
        posterPath: json["poster_path"]?? "",
        releaseDate: json["release_date"]?? "null",
        medaitype: json["media_type"]?? " NO Data Avalibale",
      votgeeAverge: json["vote_average"] != null
          ? double.parse(json["vote_average"].toString())
          : 0.0,
    );
  }
}