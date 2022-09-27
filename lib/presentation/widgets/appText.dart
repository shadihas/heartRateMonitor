import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors/appColors.dart';
import 'package:graduation_project/core/dimension/dimension.dart';

class AppText extends StatelessWidget {
 final String text;

  const AppText({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(text,style: TextStyle(
      fontSize: Dimension.pix25,
      color: AppColors.darkColor,
      // overflow: TextOverflow.ellipsis,
    ),);
  }
}   