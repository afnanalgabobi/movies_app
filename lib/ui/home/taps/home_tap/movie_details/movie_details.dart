import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/cubit/movie_info_cubit/movie_info_view_model.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/cast.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/genres.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/movie_info.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/screen_shots.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/similar_movies.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/summary.dart';
import 'package:movies_app/utils/app_colors.dart';

import '../../../../../../model/movie_details_response/movie.dart';
import 'cubit/movie_info_cubit/movie_info_statues.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails({super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  MovieInfoViewModel viewModel = MovieInfoViewModel();
  late int movieId;
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
        viewModel.getMoviesInfo(movieID: movieId);
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
          children: [
            /*  CustomAppBar(
              title: '',
              leading: GestureDetector(
                onTap: () {
                  Navigator.pop(context);
                },
                child: const ImageIcon(
                  AssetImage(
                    AppAssets.arrowBackIcon,
                  ),
                  color: AppColors.whiteColor,
                ),
              ),
              actions: [
                Padding(
                  padding: EdgeInsets.only(right: wight * .02),
                  child: const ImageIcon(
                    AssetImage(
                      AppAssets.markIcon,
                    ),
                    color: AppColors.whiteColor,
                  ),
                )
              ],
            ),*/ // mawada
            BlocBuilder<MovieInfoViewModel, MovieInfoStatues>(
              bloc: viewModel,
              builder: (context, state) {
                if (state is LoadingMovieInfoStatues) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.yellowColor,
                    ),
                  );
                } else if (state is ErrorMovieInfoStatues) {
                  return Column(
                    children: [
                      Text(state.errorMassage!),
                      ElevatedButton(
                          onPressed: () {
                            viewModel.getMoviesInfo(movieID: movieId);
                          },
                          child: const Text('try again')),
                    ],
                  );
                } else if (state is SuccessMovieInfoStatues) {
                  MovieModel movie = state.movie!;
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      MovieInfo(
                        viewModel: viewModel,
                        movieId: movieId,
                      ),
                      SizedBox(
                        height: size.height * .02,
                      ),
                      ScreenShots(movie: myMovie, movieId: movieId), //Alia
                      SizedBox(
                        height: size.height * .02,
                      ),
                      SimilarMovies(movie: myMovie,), // Afnan
                      MovieSummary(movie: movie), // Nouran
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Cast(movie: movie), // Fatima
                      SizedBox(
                        height: size.height * .02,
                      ),
                      Genres(
                        movie: movie,
                      ), // Nouran
                    ],
                  );
                }
                return Container(); // unreachable
              },
            ),
          ],
          // child: Padding(
          //   padding:  EdgeInsets.symmetric(horizontal: height * 0.02),
          //   child: Column(
          //     spacing: height * 0.02,
          //     children: [
          //       MovieInfo(), // Mawada
          //       ScreenShots(), //Alia
          //       SimilarMovies(movie: movie,), // Afnan
          //       Summary(), // Noran
          //       Cast(), // Fatima
          //       Genres(),// Noran
        ),
      ),
    );
  }
}
