import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/data/avatarList.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/ui/home/taps/profile_tap/cubit/profile_states.dart';
import 'package:movies_app/ui/home/taps/profile_tap/cubit/profile_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../../utils/app_assets.dart';
import '../../../../utils/app_colors.dart';
import '../../../../utils/app_routes.dart';
import '../../../widgets/custom_elevated_button.dart';

class ProfileTapScreen extends StatefulWidget {
  const ProfileTapScreen({super.key});

  @override
  State<ProfileTapScreen> createState() => _ProfileTapScreenState();
}

class _ProfileTapScreenState extends State<ProfileTapScreen> {
  int currentIndex = 0;
  ProfileViewModel viewModel = ProfileViewModel();

  _printTestToken() async {
    final prefs = await SharedPreferences.getInstance();
    String? token = prefs.getString('token');
    print("Token => $token");
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _printTestToken();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: BlocProvider<ProfileViewModel>(
        create: (context) => viewModel,
        child: BlocBuilder<ProfileViewModel, ProfileStates>(
          builder: (context, state) {
            if (state is getProfileLoadingState) {
              return const SizedBox.expand(
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.yellowColor,
                  ),
                ),
              );
            } else if (state is getProfileErrorState) {
              return ErrorWidget(state.errorMessage);
            } else if (state is getProfileSuccessState) {
              return Column(
                children: [
                  Container(
                    decoration: const BoxDecoration(
                      color: AppColors.grayColor,
                    ),
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.height * 0.024),
                          child: Row(
                            children: [
                              Column(
                                spacing: size.height * 0.015,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.052,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.12,
                                    width: size.width * 0.27,
                                    child: Image.asset(
                                      AvatarData
                                          .avatarList[state.data.avaterId ?? 0],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(state.data.name ?? '',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayLarge),
                                ],
                              ),
                              SizedBox(
                                width: size.width * 0.1,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text("12",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium),
                                    Text(
                                        AppLocalizations.of(context)!.wish_list,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.088,
                              ),
                              Expanded(
                                child: Column(
                                  children: [
                                    Text("11",
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium),
                                    Text(AppLocalizations.of(context)!.history,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyLarge),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.024,
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                              horizontal: size.width * 0.2),
                          child: Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: CustomElevatedButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context,
                                        AppRoutes.updateProfileScreenRouteName,
                                        arguments: [state.data, viewModel]);
                                  },
                                  text: AppLocalizations.of(context)!
                                      .edit_profile,
                                  textStyle:
                                      Theme.of(context).textTheme.headlineLarge,
                                ),
                              ),
                              SizedBox(
                                width: size.width * 0.02,
                              ),
                              Expanded(
                                flex: 1,
                                child: CustomElevatedButton(
                                    backgroundColor: AppColors.redColor,
                                    borderColor: AppColors.transparentColor,
                                    onPressed: () {
                                      Navigator.pushReplacementNamed(context,
                                          AppRoutes.loginScreenRouteName);
                                    },
                                    textStyle: Theme.of(context)
                                        .textTheme
                                        .headlineMedium,
                                    icon: true,
                                    iconWidget: Image.asset(AppAssets.exitIcon),
                                    text: AppLocalizations.of(context)!.exit),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: size.height * 0.03,
                        ),
                        DefaultTabController(
                          length: 2,
                          child: TabBar(
                            onTap: (index) {
                              currentIndex = index;
                              setState(() {});
                            },
                            indicatorColor: AppColors.yellowColor,
                            indicatorSize: TabBarIndicatorSize.tab,
                            dividerColor: Colors.transparent,
                            tabs: [
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: size.height * 0.019),
                                child: Column(
                                  children: [
                                    Image.asset(AppAssets.watchListIcon),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Text(
                                        AppLocalizations.of(context)!
                                            .watch_list,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ],
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(
                                    bottom: size.height * 0.019),
                                child: Column(
                                  children: [
                                    Image.asset(AppAssets.historyIcon),
                                    SizedBox(
                                      height: size.height * 0.01,
                                    ),
                                    Text(AppLocalizations.of(context)!.history,
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyMedium),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Column(
                    children: [
                      SizedBox(
                        height: size.height * 0.18,
                      ),
                      Image.asset("assets/images/empty.png"),
                    ],
                  )
                ],
              );
            } else {
              return const SizedBox.shrink();
            }
          },
        ),
      ),
    );
  }
}
