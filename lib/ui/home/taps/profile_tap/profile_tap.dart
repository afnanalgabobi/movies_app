import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/ui/home/taps/profile_tap/profile_view.dart';
import 'package:movies_app/ui/home/taps/profile_tap/profile_view_model.dart';

class ProfileTap extends StatelessWidget {
  const ProfileTap({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit()..loadProfile(),
      child:  ProfileView(),
    );
  }
}
