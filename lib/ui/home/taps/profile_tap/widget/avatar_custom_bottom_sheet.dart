import 'package:flutter/material.dart';
import 'package:movies_app/data/avatarList.dart';
import 'package:movies_app/utils/app_colors.dart';

class AvatarCustomBottomSheet extends StatelessWidget {
  const AvatarCustomBottomSheet({
    super.key,
    required this.onAvatarSelected,
    required this.selectedAvatarIndex,
  });

  final Function(int) onAvatarSelected;

  final int selectedAvatarIndex;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: size.width * 0.16, vertical: size.height * 0.16),
      child: Container(
        width: double.infinity,
        height: size.height * 0.41,
        decoration: BoxDecoration(
          color: AppColors.grayColor,
          borderRadius: BorderRadius.circular(24),
        ),
        child: Padding(
          padding: EdgeInsets.all(size.width * 0.8),
          child: GridView.builder(
            itemCount: AvatarData.avatarList.length,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3,
              crossAxisSpacing: size.width * 0.12,
              mainAxisSpacing: size.width * 0.12,
              childAspectRatio: 1,
            ),
            itemBuilder: (context, index) {
              bool isSelected = selectedAvatarIndex == index;
              return GestureDetector(
                onTap: () {
                  onAvatarSelected(index);
                  Navigator.pop(context);
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: isSelected
                        ? const Color.fromARGB(154, 255, 186, 59)
                        : Colors.transparent,
                    borderRadius: BorderRadius.circular(20),
                    border: Border.all(
                      color: AppColors.yellowColor,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Image.asset(
                      AvatarData.avatarList[index],
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
