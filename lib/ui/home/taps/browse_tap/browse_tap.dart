import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/home/taps/browse_tap/widget/movie_tab_item.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/category_movie_cubit/category_movie_statues.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/category_movie_cubit/category_movie_view_model.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/movie_cubit/movie_statues.dart';
import 'package:movies_app/ui/home/taps/home_tap/cubit/movie_cubit/movie_view_model.dart';
import 'package:movies_app/utils/app_styles_inter.dart';

import '../../../../model/responsemovies/movie.dart';
import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_gride_view/custom_gride_view.dart';

class BrowseTap extends StatefulWidget {
  BrowseTap({super.key});

  @override
  State<BrowseTap> createState() => _BrowseTapState();
}

class _BrowseTapState extends State<BrowseTap> {
  int selectedIndex = 0;
  MovieViewModel movieViewModel = MovieViewModel();
  CategoryMovieViewModel categoryMovieViewModel = CategoryMovieViewModel();
  List<String> movieNameList = [];
  List<Movie> browseList = [];
  @override
  void initState() {
    movieViewModel.getMoviesList();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
        child: Column(
          children: [
            BlocBuilder<MovieViewModel, MovieStatues>(
              bloc: movieViewModel,
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
                            movieViewModel.getMoviesList();
                          },
                          child: const Text('try again')),
                    ],
                  );
                } else if (state is SuccessMovieStatues) {
                  movieNameList = state.listmovies!
                      .map((movie) => movie.genres?.first ?? '')
                      .toSet()
                      .toList();
                  categoryMovieViewModel.getCategorytMoviesList(
                      category: movieNameList[selectedIndex]);
                  return DefaultTabController(
                      length: movieNameList.length,
                      child: TabBar(
                        onTap: (index) {
                          selectedIndex = index;
                          categoryMovieViewModel.getCategorytMoviesList(
                              category: movieNameList[selectedIndex]);
                          setState(() {});
                        },
                        indicatorColor: AppColors.transparentColor,
                        isScrollable: true,
                        tabAlignment: TabAlignment.start,
                        labelPadding: EdgeInsets.zero,
                        dividerColor: AppColors.transparentColor,
                        tabs: movieNameList.map((movieName) {
                          return MovieTabItem(
                              isSelected: selectedIndex ==
                                  movieNameList.indexOf(movieName),
                              movieName: movieName,
                              selectedBgColor: AppColors.yellowColor,
                              selectedTextStyle:
                                  Theme.of(context).textTheme.titleLarge!,
                              unSelectedTextStyle: AppStylesInter.bold20Yellow);
                        }).toList(),
                      ));
                }
                return Container(); // unreachable
              },
            ),
            SizedBox(
              height: size.height * 0.02,
            ),
            BlocBuilder<CategoryMovieViewModel, CategoryMovieStatues>(
              bloc: categoryMovieViewModel,
              builder: (context, state) {
                if (state is LoadingCategoryMovieStatues) {
                  return const Center(
                    child: CircularProgressIndicator(
                      color: AppColors.yellowColor,
                    ),
                  );
                } else if (state is ErorrCategoryMovieStatues) {
                  return Column(
                    children: [
                      Text(state.errormessage!),
                      ElevatedButton(
                          onPressed: () {
                            categoryMovieViewModel.getCategorytMoviesList(
                                category: movieNameList[selectedIndex]);
                          },
                          child: const Text('try again')),
                    ],
                  );
                } else if (state is SuccessCategoryMovieStatues) {
                  browseList = state.listmovies!;
                  return Expanded(
                    child: CustomGrideView(
                      moviesList: browseList,
                      crossAxisCount: 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20,
                      //     itemCount: 10,
                      // childAspectRatio: 2 / 3,
                      // isMovie: false,
                    ),
                  );
                }
                return Container(); // unreachable
              },
            ),
          ],
        ),
      )),
    );
  }
}
