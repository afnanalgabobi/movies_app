import 'package:flutter/material.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/cubit/movie_info_cubit/movie_info_view_model.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/cast.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/genres.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/movie_info.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/screen_shots.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/similar_movies.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/summary.dart';
import 'package:movies_app/utils/app_colors.dart';

import '../../../../../model/responsemovies/movie.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails({super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  MovieInfoViewModel viewModel = MovieInfoViewModel();
  int? movieId;
  var myMovie;
  @override
  void initState() {
    super.initState();

    // نستنى لما الwidget يخلص build ونقرأ arguments
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)!.settings.arguments as List;
      if (args != null && args[1] is int) {
        setState(() {
          myMovie = args[0];
          movieId = args[1];
        });
        viewModel.getMoviesInfo(movieID: movieId!);
      } else {
        print("❌ Invalid or missing movieId in arguments: $args");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: AppColors.transparentColor,
      body: SingleChildScrollView(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          MovieInfo(
            viewModel: viewModel,
            movieId: movieId,
          ), // mawada
          SizedBox(
            height: size.height * .02,
          ),
           ScreenShots(movieId: movieId,), //Alia
          SizedBox(
            height: size.height * .02,
          ),
          SimilarMovies(
            movie: myMovie,
          ), // Afnan
          MovieSummary(movie: myMovie), // Nouran
          SizedBox(
            height: size.height * .02,
          ),
          const Cast(), // Fatima
          SizedBox(
            height: size.height * .02,
          ),
          Genres(
            movie: myMovie,
          ), // Nouran
        ],
      )),
    );
  }
}
