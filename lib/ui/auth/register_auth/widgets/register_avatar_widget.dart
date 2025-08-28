import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

import '../../../../../data/avatarList.dart';

class RegisterAvatarWidget extends StatefulWidget {
  final dynamic Function(int, CarouselPageChangedReason)? onPageChanged;

  RegisterAvatarWidget({super.key, required this.onPageChanged});

  @override
  State<RegisterAvatarWidget> createState() => _RegisterAvatarWidgetState();
}

class _RegisterAvatarWidgetState extends State<RegisterAvatarWidget> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return CarouselSlider.builder(
      itemCount: AvatarData.avatarList.length,
      itemBuilder: (context, index, realIndex) {
        return Image.asset(
          AvatarData.avatarList[index],
          fit: BoxFit.contain,
        );
      },
      options: CarouselOptions(
        height: height * 0.17,
        onPageChanged: widget.onPageChanged,
        enlargeCenterPage: true,
        viewportFraction: 0.35,
        enlargeFactor: 0.4,
        scrollDirection: Axis.horizontal,
      ),
    );
  }
}