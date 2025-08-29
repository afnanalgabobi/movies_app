import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/model/responsemovies/movie.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/category_index_cubit/category_index_cubit.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/category_movie_cubit/category_movie_statues.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/category_movie_cubit/category_movie_view_model.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/history_cubit/history_cubit.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/history_cubit/history_status.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/movie_cubit/movie_statues.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/movie_cubit/movie_view_model.dart';
import 'package:movies_app/ui/home/taps/home_tap/movie_widget.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';

class HomeTap extends StatefulWidget {
  HomeTap({super.key});

  @override
  State<HomeTap> createState() => _HomeTapState();
}

class _HomeTapState extends State<HomeTap> {
  String? selectedCategory;
  MovieViewModel viewModel = MovieViewModel();
  CategoryMovieViewModel categoryMovieViewModel = CategoryMovieViewModel();
  @override
  void initState() {
    viewModel.getMoviesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Stack(
      children: [
        BlocBuilder<HistoryCubit, HistoryStatus>(
          builder: (context, state) {
            if (state is UpdatedHistoryStatus) {
              return Opacity(
                opacity: .3,
                child: Image.network(
                  state.backgroundmovie.mediumCoverImage!,
                  // state.historymovie.last.mediumCoverImage!,
                  width: double.infinity,
                  height: double.infinity,
                  fit: BoxFit.cover,
                ),
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        Scaffold(
            backgroundColor: AppColors.transparentColor,
            body: SafeArea(
              child: Column(children: [
                Image.asset(AppAssets.availableNowImage),
                BlocBuilder<MovieViewModel, MovieStatues>(
                  bloc: viewModel,
                  builder: (context, state) {
                    if (state is LoadingMovieStatues) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.yellowColor,
                        ),
                      );
                    } else if (state is ErrorMovieStatues) {
                      return Column(
                        children: [
                          Text(state.errorMassage!),
                          ElevatedButton(
                              onPressed: () {
                                viewModel.getMoviesList();
                              },
                              child: const Text('try again')),
                        ],
                      );
                    } else if (state is SuccessMovieStatues) {
                      List<Movie> moviesList = state.listmovies!;
                      // to sorted list by
                      var sortedMoviesList = [...moviesList];
                      sortedMoviesList.sort((a, b) {
                        final dateA = a.dateUploadedUnix ?? 0;
                        final dateB = b.dateUploadedUnix ?? 0;
                        return dateB.compareTo(dateA);
                      });
                      // get category
                      final categories = state.listmovies!
                          .map((movie) => movie.genres?.first ?? '')
                          .toSet()
                          .toList();
                      var index = context
                          .read<CategoryIndexCubit>()
                          .currentCategoryIndex;
                      if (index >= categories.length) {
                        index = 0;
                      }
                      selectedCategory = categories[index];

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        categoryMovieViewModel.getCategorytMoviesList(
                            category: selectedCategory!);
                      });
                      return CarouselSlider.builder(
                        options: CarouselOptions(
                          height: size.height * .3,
                          enlargeCenterPage: true,
                          viewportFraction: 0.35,
                        ),
                        itemCount: sortedMoviesList.length,
                        itemBuilder: (BuildContext context, int itemIndex,
                                int pageViewIndex) =>
                            MovieWidget(
                          movie: sortedMoviesList[itemIndex],
                        ),
                      );
                    }
                    return Container(); // unreachable
                  },
                ),
                Image.asset(AppAssets.watchNowImage),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: size.width * .02),
                  child: Row(
                    children: [
                      Text(
                        selectedCategory ?? '',
                        style: AppStylesRoboto.regular20White,
                      ),
                      const Spacer(),
                      Text(
                        AppLocalizations.of(context)!.seeMore,
                        style: AppStylesRoboto.regular16Yellow,
                      ),
                      const Icon(
                        Icons.arrow_right_outlined,
                        color: AppColors.yellowColor,
                      ),
                    ],
                  ),
                ),
                BlocBuilder<CategoryMovieViewModel, CategoryMovieStatues>(
                  bloc: categoryMovieViewModel,
                  builder: (context, state) {
                    if (state is LoadingCategoryMovieStatues) {
                      return const CircularProgressIndicator(
                        color: AppColors.yellowColor,
                      );
                    } else if (state is ErorrCategoryMovieStatues) {
                      return Column(
                        children: [
                          Text(state.errormessage!),
                          ElevatedButton(
                              onPressed: () {}, child: const Text('try again')),
                        ],
                      );
                    } else if (state is SuccessCategoryMovieStatues) {
                      List<Movie> moviecategorylist = state.listmovies!;
                      return SizedBox(
                        height: size.height * .16,
                        child: ListView.separated(
                          scrollDirection: Axis.horizontal,
                          itemCount: moviecategorylist.length,
                          itemBuilder: (context, index) {
                            return Padding(
                              padding: EdgeInsets.only(left: size.width * .02),
                              child: MovieWidget(
                                movie: moviecategorylist[index],
                              ),
                              //  MovieWidget(),
                            );
                          },
                          separatorBuilder: (context, index) {
                            return SizedBox(
                              width: size.width * .009,
                            );
                          },
                        ),
                      );
                    }
                    return Container();
                  },
                ),
              ]),
            ))
      ],
    );
  }
}
