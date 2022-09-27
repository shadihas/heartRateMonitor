import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors/appColors.dart';
import 'package:graduation_project/core/dimension/dimension.dart';

class SaveButton extends StatelessWidget {
  final String text;
  const SaveButton({
    required this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            color: AppColors.darkColor,
            borderRadius: BorderRadius.circular(10)),
        height: Dimension.pix50,
        width: Dimension.screenWidth/3,
        child: Center(
            child: Text(
          text,
          style: TextStyle(
              color: AppColors.lightColor,
              fontSize: 20,
              fontWeight: FontWeight.w500),
        )));
  }
}
