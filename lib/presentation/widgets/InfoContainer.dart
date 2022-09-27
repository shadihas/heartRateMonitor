import 'package:flutter/material.dart';
import 'package:graduation_project/core/colors/appColors.dart';
import 'package:graduation_project/core/dimension/dimension.dart';
import 'package:graduation_project/presentation/widgets/widgets.dart';

class InfoContainer extends StatelessWidget {
 final AppText appText;
 final AppText appDataText;
 final double height;
  const InfoContainer({
    Key? key,
    required this.height,
    required this.appText,
     required this.appDataText,
    
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(

      height: height,
      width: Dimension.screenWidth/2,
      margin: EdgeInsets.all(Dimension.pix10),
      decoration: BoxDecoration(
        color: AppColors.lightColor,
        borderRadius: BorderRadius.circular(Dimension.pix15),
        border: Border.all(color: AppColors.darkColor)
      ),
      child: Column(children: [appText, 
      SizedBox(height: Dimension.pix10,),
      Padding(
        padding: EdgeInsets.all(Dimension.pix5),
        child: Center(child: appDataText),
      ),])
    );
  }
}
