import 'package:flutter/material.dart';
import 'package:movies_app/model/responsemovies/movie.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/cast.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/genres.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/movie_info.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/screen_shots.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/similar_movies.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/summary.dart';
import 'package:movies_app/ui/widgets/custom_app_bar.dart';

class MovieDetails extends StatelessWidget {
  MovieDetails({super.key});

  @override
  Widget build(BuildContext context) {
    Movie movie = ModalRoute.of(context)!.settings.arguments as Movie;
    var height = MediaQuery.sizeOf(context).height;

    return Scaffold(
      appBar: CustomAppBar(title: movie.title.toString()), // Mawada
      body: SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.symmetric(horizontal: height * 0.02),
          child: Column(
            spacing: height * 0.02,
            children: [
              MovieInfo(), // Mawada
              ScreenShots(), //Alia
              // SimilarMovies(movie: movie,), // Afnan
              Summary(), // Noran
              Cast(), // Fatima
              Genres(),// Noran
            ],
          ),
        ),
      ),
    );
  }
}
