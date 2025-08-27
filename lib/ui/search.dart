import 'package:flutter/material.dart';
import 'package:movies_app/ui/widgets/custom_gride_view/custom_gride_view.dart';

class Search extends StatelessWidget {
  static const String routeName = 'search_screen';

  const Search({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomGrideView(
          crossAxisCount: 3, crossAxisSpacing: 20, mainAxisSpacing: 30),
    );
  }
}
