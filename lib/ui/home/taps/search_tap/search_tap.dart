import 'package:flutter/material.dart';
import 'package:movies_app/providers/app_theme_provider.dart';
import 'package:movies_app/ui/widgets/custom_gride_view_network/custom_gride_view.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:provider/provider.dart';
import '../../../../model/responsemovies/movie.dart';
import '../../../../utils/app_assets.dart';
import '../../../widgets/custom_text_form_field.dart';

class SearchTap extends StatelessWidget {
   SearchTap({super.key});
  List<Movie> searchList = [
    Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar2),
    Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar2),
    Movie(title: 'name', rating: 7.5, backgroundImage: AppAssets.avatar2),
  ];
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
                  child: CustomGrideView_Network(
                    moviesList: searchList,
                    crossAxisCount: 2,
                    crossAxisSpacing: 20,
                    mainAxisSpacing: 20,
                //     itemCount: 10,
                //     childAspectRatio: 2/3,
                // isMovie: false,
              ),
                ),
              ],
            ),
          )
      ),
    );
  }
}