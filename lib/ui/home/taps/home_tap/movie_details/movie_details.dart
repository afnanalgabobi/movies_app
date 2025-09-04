import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/model/movie_details_response/movie.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/cubit/movie_info_cubit/movie_info_statues.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/cubit/movie_info_cubit/movie_info_view_model.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/cast.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/genres.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/movie_info.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/screen_shots.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/widgets/summary.dart';
import 'package:movies_app/utils/app_colors.dart';

class MovieDetails extends StatefulWidget {
  MovieDetails({super.key});

  @override
  State<MovieDetails> createState() => _MovieDetailsState();
}

class _MovieDetailsState extends State<MovieDetails> {
  MovieInfoViewModel viewModel = MovieInfoViewModel();
  int? movieId;
  @override
  void initState() {
    super.initState();

    // نستنى لما الwidget يخلص build ونقرأ arguments
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final args = ModalRoute.of(context)!.settings.arguments;
      if (args != null && args is int) {
        setState(() {
          movieId = args;
        });
        viewModel.getMoviesInfo(movieID: movieId!);
      } else {
        print("❌ Invalid or missing movieId in arguments: $args");
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    movieId = ModalRoute.of(context)!.settings.arguments as int;
    var wight = MediaQuery.sizeOf(context).width;
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
                            viewModel.getMoviesInfo(movieID: movieId!);
                          },
                          child: const Text('try again')),
                    ],
                  );
                } else if (state is SuccessMovieinfoStatues) {
                  Movie movie = state.movie!;
                  return MovieInfo(
                    movie: movie,
                  );
                }
                return Container(); // unreachable
              },
            ),
            ScreenShots(), //Alia
            // SimilarMovies(movie: movie,), // Afnan
            Summary(), // Noran
            Cast(), // Fatima
            Genres(), // Noran
          ],
        ),
      ),
    );
  }
}
