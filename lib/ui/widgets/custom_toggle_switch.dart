import 'package:flutter/material.dart';
import 'package:movies_app/utils/app_assets.dart';
import 'package:movies_app/utils/app_colors.dart';
import 'package:toggle_switch/toggle_switch.dart';

class CustomToggleSwitch extends StatefulWidget {
  const CustomToggleSwitch({super.key});

  @override
  State<CustomToggleSwitch> createState() => _CustomToggleSwitchState();
}

class _CustomToggleSwitchState extends State<CustomToggleSwitch> {
  int activeIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      child: ToggleSwitch(
        customWidgets: [
          Container(
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                color: activeIndex == 0
                    ? AppColors.yellowColor
                    : AppColors.transparentColor,
                width: 3,
              ),
            ),
            child: Image.asset(
              AppAssets.americaFlag,
              fit: BoxFit.fill,
            ),
          ),
          Container(
            width: 40,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(
                  color: activeIndex == 1
                      ? AppColors.yellowColor
                      : AppColors.transparentColor,
                  width: 3),
            ),
            child: Image.asset(
              AppAssets.egyptFlag,
              fit: BoxFit.fitWidth,
            ),
          )
        ],
        minWidth: 60.0,
        activeBgColor: const [
          AppColors.transparentColor,
          AppColors.transparentColor
        ],
        inactiveBgColor: Colors.transparent,
        borderColor: const [AppColors.yellowColor],
        cornerRadius: 40,
        totalSwitches: 2,
        initialLabelIndex: 1,
        onToggle: (index) {
          setState(() {
            activeIndex = index!;
          });
          print('switched to: $index');
        },
      ),
    );
  }
}
