import 'package:movies_app/model/movie_details_response/movie.dart';

class Data {
  Movie? movie;
  int? movieCount;
  int? limit;
  int? pageNumber;
  List<Movie>? moviesList;

  Data(
      {this.movie,
      this.movieCount,
      this.limit,
      this.pageNumber,
      this.moviesList});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        movie: json['movie'] == null
            ? null
            : Movie.fromJson(json['movie'] as Map<String, dynamic>),
        movieCount: json['movie_count'] as int?,
        limit: json['limit'] as int?,
        pageNumber: json['page_number'] as int?,
        moviesList: (json['movies'] as List<dynamic>?)
            ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'movie': movie,
        'movie_count': movieCount,
        'limit': limit,
        'page_number': pageNumber,
        'movies': moviesList?.map((e) => e.toJson()).toList(),
      };
}
