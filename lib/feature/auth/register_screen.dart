import 'package:flutter/material.dart';
import 'package:movies_app/l10n/app_localizations.dart';
import 'package:movies_app/utils/app_assets.dart';

class RegisterScreen extends StatefulWidget {
  RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final List<String> avatars = const [
    AppAssets.avatar1,
    AppAssets.avatar2,
    AppAssets.avatar3,
    AppAssets.avatar4,
    AppAssets.avatar5,
    AppAssets.avatar6,
    AppAssets.avatar7,
    AppAssets.avatar8,
    AppAssets.avatar9,
  ];

  final ScrollController _scrollController = ScrollController();

  int currentIndex = 0;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(() {
      double offset = _scrollController.offset; // المسافة الأفقية
      double itemWidth = 120; // عرض العنصر (لازم يكون ثابت علشان الحساب مضبوط)
      int index = (offset / itemWidth).round();
      setState(() {
        currentIndex = index;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(AppLocalizations.of(context)!.register)),
      body: Column(
        children: [
          SizedBox(
            height: 160,
            child: ListView.separated(
              controller: _scrollController,
              separatorBuilder: (context, index) {
                return const SizedBox(
                  width: 20,
                );
              },
              scrollDirection: Axis.horizontal,
              itemCount: avatars.length,
              itemBuilder: (context, index) {
                return CircleAvatar(
                  radius: index == currentIndex + 1 ? 75 : 45,
                  child: Image.asset(
                    avatars[index],
                    width: double.infinity,
                    fit: BoxFit.fill,
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
