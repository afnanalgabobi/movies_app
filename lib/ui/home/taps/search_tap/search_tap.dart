import 'package:flutter/material.dart';
import 'package:movies_app/providers/app_theme_provider.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:provider/provider.dart';

import '../../../../utils/app_assets.dart';
import '../../../widgets/custom_grid_view/custom_grid_view.dart';
import '../../../widgets/custom_text_form_field.dart';

class SearchTap extends StatelessWidget {
  const SearchTap({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController controller=TextEditingController();
    var size=MediaQuery.of(context).size;
    var themeProvider=Provider.of<AppThemeProvider>(context);
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: size.width*0.04),
            child: Column(
              children: [
                CustomTextFormField(controller: controller,
                  prefixIcon: Image.asset(AppAssets.searchIcon,color:themeProvider.isDarkMode()?AppColors.blackColor:AppColors.whiteColor,),
                  hintText: 'Movie',),
                SizedBox(height:size.height*0.02 ,),
                Expanded(
                  child: CustomGridView(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    itemCount: 10,
                    childAspectRatio: 2/3,
                isMovie: false,
              ),
                ),
              ],
            ),
          )
      ),
    );
  }
}