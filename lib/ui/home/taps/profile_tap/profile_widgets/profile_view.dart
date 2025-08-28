import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/models/movie_model.dart';
import '../../../../../data/avatarList.dart';
import '../../../../../l10n/app_localizations.dart';
import '../../../../../utils/app_assets.dart';
import '../../../../../utils/app_colors.dart';
import '../../../../../utils/app_routes.dart';
import '../../../../widgets/custom_elevated_button.dart';
import '../../../../widgets/custom_gride_view/custom_gride_view.dart';
import '../profile_view_model.dart';

class ProfileView extends StatefulWidget {
  ProfileView({super.key});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  var avatarList = AvatarData.avatarList;
  var viewModel = ProfileCubit();

  @override
  Widget build(BuildContext context) {
    List<Movie> watchList = [
      Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar1),
      Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar2),
      Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar3),
      Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar4),
      Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar5),

    ];
    List<Movie> historyList = [
      Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar1),
      Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar2),
      Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar3),
      Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar4),
      Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar5),
      Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar1),
      Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar2),
      Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar3),
      Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar4),
      Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar5),

    ];
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return BlocBuilder<ProfileCubit, ProfileState>(
        // bloc: vm,
        builder: (context, state) {
      if (state is ProfileLoading) {
        return const Center(
            child: CircularProgressIndicator(
          color: AppColors.yellowColor,
        ));
      } else if (state is ProfileLoaded) {
        // print('ProfileLoaded');
        return Scaffold(
          body: DefaultTabController(
            length: 2,
            child: Scaffold(
                backgroundColor: Theme.of(context).dividerColor,
                body: SafeArea(
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Expanded(
                            child: Column(
                              spacing: height * 0.01,
                              children: [
                                CircleAvatar(
                                    radius: height * 0.06,
                                    backgroundColor: AppColors.transparentColor,
                                    child: Image.asset(
                                        avatarList[viewModel.profile.avatar])),
                                Text(
                                  maxLines: 2,
                                  " ${state.user.name}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              spacing: height * 0.02,
                              children: [
                                Text(
                                  '12',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.wish_list,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                )
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              spacing: height * 0.02,
                              children: [
                                Text(
                                  '10',
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                ),
                                Text(
                                  AppLocalizations.of(context)!.history,
                                  style: Theme.of(context)
                                      .textTheme
                                      .headlineMedium,
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(height * 0.02),
                        child: Row(
                          spacing: 16,
                          children: [
                            Expanded(
                                flex: 2,
                                child: CustomElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context,
                                        AppRoutes.updateProfileScreenRouteName,
                                        arguments: state.user);
                                  },
                                  text: 'edit',
                                  // AppLocalizations.of(context)!
                                  //     .edit_profile,
                                  textStyle:
                                      Theme.of(context).textTheme.headlineLarge,
                                )),
                            Expanded(
                                flex: 1,
                                child: CustomElevatedButton(
                                    backgroundColor: AppColors.redColor,
                                    borderColor: AppColors.transparentColor,
                                    onPressed: () {},
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                    icon: true,
                                    iconWidget: Image.asset(AppAssets.exitIcon),
                                    text: 'exit'
                                    // AppLocalizations.of(context)!.exit
                                ))
                          ],
                        ),
                      ),
                      Center(
                        child: TabBar(
                          onTap: (index) {
                            viewModel.changeTab(index);
                            setState(() {});
                            print(viewModel.selectedTab);
                          },
                          padding: EdgeInsets.zero,
                          indicator: const UnderlineTabIndicator(
                              borderSide: BorderSide(
                            color: AppColors.yellowColor,
                            width: 2,
                          )),
                          labelColor: Theme.of(context).canvasColor,
                          unselectedLabelColor: Theme.of(context).canvasColor,
                          labelStyle:
                              Theme.of(context).textTheme.headlineMedium,
                          tabAlignment: TabAlignment.center,
                          unselectedLabelStyle:
                              Theme.of(context).textTheme.headlineMedium,
                          tabs: [
                            Tab(
                              icon: const ImageIcon(
                                AssetImage(AppAssets.watchListIcon),
                                color: AppColors.yellowColor,
                              ),
                              child: Text(
                                  AppLocalizations.of(context)!.watch_list),
                            ),
                            Tab(
                              icon: const ImageIcon(
                                AssetImage(AppAssets.historyIcon),
                                color: AppColors.yellowColor,
                              ),
                              child:
                                  Text(AppLocalizations.of(context)!.history),
                            )
                          ],
                        ),
                      ),
                      SizedBox(height: height * 0.02,),
                      Expanded(child:
                      viewModel.selectedTab == 0
                          ? watchList.isEmpty
                              ? Container(
                                  color: Theme.of(context).dividerColor,
                                  child: Center(
                                    child: Image.asset(AppAssets.emptyImage),
                                  ),
                                )
                              : Padding(
                                padding:  EdgeInsets.symmetric(horizontal: width * 0.04),
                                child: CustomGrideView(
                                crossAxisCount: 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20, moviesList: watchList,
                                                                ),
                              )
                          : historyList.isEmpty
                              ? Container(
                                  color: Theme.of(context).dividerColor,
                                  child: Center(
                                    child: Image.asset(AppAssets.emptyImage),
                                  ))
                              : Padding(
                        padding:  EdgeInsets.symmetric(horizontal: width * 0.04),
                                child: CustomGrideView(
                                crossAxisCount: 3,
                                crossAxisSpacing: 20,
                                mainAxisSpacing: 20, moviesList: historyList
                                                                ),
                              ))
                    ]))),
          ),
        );
      } else if (state is ProfileError) {
        return Center(child: Text(state.message));
      }
      return const SizedBox.shrink();
    });
  }
}
