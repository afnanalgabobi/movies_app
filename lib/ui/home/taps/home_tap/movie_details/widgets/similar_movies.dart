import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/cubit/suggested_movie_cubit/suggested_movie_statues.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_details/cubit/suggested_movie_cubit/suggested_movie_view_model.dart';
import 'package:movies_app/ui/widgets/custom_gride_view_network/custom_gride_view.dart';

import '../../../../../../model/movie_details_response/movie.dart';
import '../../../../../../utils/app_colors.dart';

class SimilarMovies extends StatefulWidget {
  final Movie movie;
 const SimilarMovies({super.key, required this.movie});
  @override
  State<SimilarMovies> createState() => _SimilarMoviesState();
}

class _SimilarMoviesState extends State<SimilarMovies> {
  SuggestedMovieViewModel suggestedViewModel = SuggestedMovieViewModel();


  // @override
  void initState() {
    suggestedViewModel.getSuggestedMoviesList(movieId: widget.movie.id.toString());
    super.initState();
  }
  @override
  Widget build(BuildContext context) {

    var height = MediaQuery.sizeOf(context).height;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text(AppLocalizations.of(context)!.similar, style: Theme.of(context).textTheme.headlineMedium),
          BlocBuilder<SuggestedMovieViewModel, SuggestedMovieStatues>(
            bloc: suggestedViewModel,
            builder: (context, state) {
              if (state is LoadingSuggestedMovieStatues) {
                return Padding(
                  padding:  EdgeInsets.all(height * 0.02),
                  child: const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.yellowColor,
                    ),
                  ),
                );
              } else if (state is ErrorSuggestedMovieStatues) {
                return Column(
                  children: [
                    Text(state.errorMassage!),
                    ElevatedButton(
                        onPressed: () {
                          print(widget.movie.id.toString());
                          // context.read<SuggestedMovieViewModel>().getSuggestedMoviesList(movieId: widget.movie.id);
                          suggestedViewModel.getSuggestedMoviesList(
                              movieId: widget.movie.id.toString());
                        },
                        child: const Text('try again')),
                  ],
                );
              } else if (state is SuccessSuggestedMovieStatues) {

                List<Movie> suggestedMoviesList = state.suggestedMovieList!;
                print(suggestedMoviesList[0].title);
                print(widget.movie!.id);

                return SizedBox(
                    height: height * 0.5,
                    child: CustomGrideView_Network(
                        crossAxisCount: 2,
                        crossAxisSpacing: 20,
                        mainAxisSpacing: 20,
                        moviesList: suggestedMoviesList));
              }
              return Container(); // unreachable
            },
          ),
        ],
      ),
    );
  }
}
