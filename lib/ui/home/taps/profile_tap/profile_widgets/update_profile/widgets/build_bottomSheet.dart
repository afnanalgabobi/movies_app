import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../../../../data/avatarList.dart';
import '../../../../../../../providers/profile_provider.dart';
import '../../../../../../../utils/app_colors.dart';


class BuildBottomSheet extends StatefulWidget {
  final Function(int) onChooseAvatar;
  BuildBottomSheet({super.key, required this.onChooseAvatar});

  @override
  State<BuildBottomSheet> createState() => _BuildBottomSheetState();
}

class _BuildBottomSheetState extends State<BuildBottomSheet> {

  var avatarList = AvatarData.avatarList;
  @override
  Widget build(BuildContext context) {
    var p = Provider.of<ProfileProvider>(context);
    print(p.selectedAvatar);

    var  height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;

    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: width * 0.04,
        vertical: height * 0.02,
      ),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 3,
          crossAxisSpacing: height * 0.02,
          mainAxisSpacing: height * 0.02,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                widget.onChooseAvatar(index);
                p.selectedAvatar = index;
              });
            },
            child: Container(
              padding: EdgeInsets.all(height * 0.006),
              decoration: BoxDecoration(
                border: Border.all(color: Theme.of(context).canvasColor),
                borderRadius: BorderRadius.circular(32),
                color: p.selectedAvatar == index
                    ? AppColors.yellowColor
                    : AppColors.transparentColor,
              ),
              child: CircleAvatar(
                backgroundColor: AppColors.transparentColor,
                child: Image.asset(
                  avatarList[index],
                  height: height * 0.2,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          );
        },
        itemCount: avatarList.length,
      ),
    );
  }
}

