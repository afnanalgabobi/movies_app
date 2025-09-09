import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/providers/app_theme_provider.dart';
import 'package:movies_app/ui/home/taps/search_tap/search_tab_view_model/search_tab_cubit.dart';
import 'package:movies_app/ui/home/taps/search_tap/search_tab_view_model/search_tab_states.dart';
import 'package:movies_app/ui/widgets/custom_movies_container_item.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:movies_app/utils/app_styles_roboto.dart';
import 'package:provider/provider.dart';

import '../../../../model/movie_details_response/movie.dart';
import '../../../../utils/app_assets.dart';
import '../../../widgets/custom_text_form_field.dart';

class SearchTap extends StatefulWidget {
  const SearchTap({super.key});

  @override
  State<SearchTap> createState() => _SearchTapState();
}

class _SearchTapState extends State<SearchTap> {
  bool isSearched = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  void _onSearch(String value) {
    if (value.trim().isEmpty) {
      setState(() {
        isSearched = false;
      });
    } else {
      setState(() {
        isSearched = true;
        context.read<SearchTabCubit>().movies = [];
      });
      context.read<SearchTabCubit>().searchMovies();
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    var themeProvider = Provider.of<AppThemeProvider>(context);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Theme.of(context).primaryColor,
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: size.width * 0.04),
            child: Column(
              children: [
                CustomTextFormField(
                  onChanged: _onSearch,
                  controller: context.read<SearchTabCubit>().searchController,
                  prefixIcon: Image.asset(
                    AppAssets.searchIcon,
                    color: themeProvider.isDarkMode()
                        ? AppColors.blackColor
                        : AppColors.whiteColor,
                  ),
                  hintText: AppLocalizations.of(context)!.movie,
                  hintStyle: AppStylesRoboto.regular16White,
                  onTapOutside: (event) => FocusScope.of(context).unfocus(),
                  cursorColor: AppColors.whiteColor,
                ),
                SizedBox(
                  height: size.height * 0.02,
                ),
                Expanded(child: BlocBuilder<SearchTabCubit, SearchTabStates>(
                  builder: (context, state) {
                    if (!isSearched) {
                      return SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        keyboardDismissBehavior:
                            ScrollViewKeyboardDismissBehavior.onDrag,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: size.height * 0.32,
                            ),
                            Center(
                              child: Image.asset(
                                AppAssets.emptyImage,
                                width: size.width * 0.25,
                                fit: BoxFit.contain,
                              ),
                            )
                          ],
                        ),
                      );
                    } else if (state is SearchLoadingState) {
                      return const Center(
                        child: CircularProgressIndicator(
                          color: AppColors.yellowColor,
                        ),
                      );
                    } else if (state is SearchErrorState) {
                      return Center(
                        child: Text(state.message),
                      );
                    } else if (state is SearchEmptyState) {
                      return Center(
                        child: Image.asset(
                          AppAssets.emptyImage,
                          width: size.width * 0.36,
                          fit: BoxFit.contain,
                        ),
                      );
                    } else if (state is SearchSuccessState ||
                        state is GetMoreMoviesLoadingState) {
                      final List<Movie> moviesList =
                          context.watch<SearchTabCubit>().movies;
                      return GridView.builder(
                        controller:
                            context.read<SearchTabCubit>().scrollController,
                        itemCount: moviesList.length +
                            (state is GetMoreMoviesLoadingState ? 1 : 0),
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.65,
                            crossAxisSpacing: size.width * 0.02,
                            mainAxisSpacing: size.height * 0.01),
                        itemBuilder: (context, index) {
                          if (state is GetMoreMoviesLoadingState &&
                              index == moviesList.length) {
                            return const Padding(
                              padding: EdgeInsets.all(16),
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: AppColors.yellowColor,
                                ),
                              ),
                            );
                          }
                          final movie = moviesList[index];
                          return CustomMoviesContainerItem(
                            movieId: movie.imdbCode,
                            imagePath: movie.mediumCoverImage ?? '',
                            rating: movie.rating,
                            movie: movie,
                          );
                        },
                      );
                    } else {
                      return const SizedBox();
                    }
                  },
                )),
              ],
            ),
          ),
        ));
  }
}
