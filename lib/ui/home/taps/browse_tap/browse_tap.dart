import 'package:flutter/material.dart';
import 'package:movies_app/ui/home/taps/browse_tap/widget/movie_tab_item.dart';
import 'package:movies_app/utils/app_styles_inter.dart';

import '../../../../utils/app_colors.dart';
import '../../../widgets/custom_grid_view/custom_grid_view.dart';

class BrowseTap extends StatefulWidget {
  const BrowseTap({super.key});

  @override
  State<BrowseTap> createState() => _BrowseTapState();
}

class _BrowseTapState extends State<BrowseTap> {
  int selectedIndex=0;
  List<String>movieNameList=['Action','Adventure','Animation','Action','Adventure','Animation','Action','Adventure','Animation'];


  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
          body: Padding(
            padding:  EdgeInsets.symmetric(horizontal: size.width*0.04),
            child: Column(
              children: [
                DefaultTabController(
                    length: movieNameList.length,
                    child: TabBar(
                      onTap: (index){
                        selectedIndex=index;
                        setState(() {

                        });

                      },
                      indicatorColor: AppColors.transparentColor,
                      isScrollable: true,
                      tabAlignment: TabAlignment.start,
                      labelPadding: EdgeInsets.zero,
                      dividerColor: AppColors.transparentColor,
                      tabs: movieNameList.map((movieName){
                        return MovieTabItem(
                            isSelected: selectedIndex==movieNameList.indexOf(movieName),
                            movieName: movieName,
                            selectedBgColor: AppColors.yellowColor,
                            selectedTextStyle: Theme.of(context).textTheme.titleLarge!,
                            unSelectedTextStyle: AppStylesInter.bold20Yellow);
                      }).toList()
                      , )),
                SizedBox(height:size.height*0.02 ,),
                Expanded(
                  child: CustomGridView(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 10,
                    itemCount: 10,
                childAspectRatio: 2 / 3,
                moviesList: const [],
              ),
                ),
              ],
            ),
          )
      ),
    );
  }
}