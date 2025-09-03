import 'package:flutter/material.dart';

class ProfileTap extends StatefulWidget {
  const ProfileTap({super.key});

  @override
  State<ProfileTap> createState() => _ProfileTapState();
}

class _ProfileTapState extends State<ProfileTap> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
        /* body: BlocProvider<ProfileCubit>(
        create: (context) => viewModel,
        child: BlocBuilder<ProfileCubit, ProfileStates>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const SizedBox.expand(
                child: Center(
                  child: CircularProgressIndicator(
                    color: AppColors.yellowColor,
                  ),
                ),
              );
            } else if (state is ProfileError) {
              return ErrorWidget(state.message);
            } else if (state is ProfileLoaded) {
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
                             //   spacing: size.height * 0.015,
                                children: [
                                  SizedBox(
                                    height: size.height * 0.052,
                                  ),
                                  SizedBox(
                                    height: size.height * 0.12,
                                    width: size.width * 0.27,
                                    child: Image.asset(
                                      AvatarData
                                          .avatarList[state.user.avaterId],
                                      fit: BoxFit.contain,
                                    ),
                                  ),
                                  Text(state.user.name ,
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
                                        arguments: [state.user, viewModel]);
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
      ),*/
        );
  }
}
