import 'movie.dart';

class Data {
  int? movieCount;
  int? limit;
  int? pageNumber;
  List<Movie>? movies;

  Data({this.movieCount, this.limit, this.pageNumber, this.movies});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        movieCount: json['movie_count'] as int?,
        limit: json['limit'] as int?,
        pageNumber: json['page_number'] as int?,
        movies: (json['movies'] as List<dynamic>?)
            ?.map((e) => Movie.fromJson(e as Map<String, dynamic>))
            .toList(),
      );

  Map<String, dynamic> toJson() => {
        'movie_count': movieCount,
        'limit': limit,
        'page_number': pageNumber,
        'movies': movies?.map((e) => e.toJson()).toList(),
      };
}
