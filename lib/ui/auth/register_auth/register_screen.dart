import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/ui/auth/register_auth/widgets/register_avatar_widget.dart';
import 'package:movies_app/ui/auth/register_auth/widgets/register_form_body.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  int selectedAvatarId = 0;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
            title: Text(
          AppLocalizations.of(context)!.register,
        )),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: size.width * .04,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                RegisterAvatarWidget(
                  onPageChanged: (index, reason) {
                    setState(() {
                      selectedAvatarId = index;
                    });
                  },
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                Text(
                  AppLocalizations.of(context)!.avatar,
                  style: Theme.of(context).textTheme.titleMedium,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: size.height * 0.01,
                ),
                RegisterFormBody(selectedAvatarId: selectedAvatarId),
              ],
            ),
          ),
        ));
  }
}
