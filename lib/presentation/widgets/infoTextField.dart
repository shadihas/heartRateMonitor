import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import 'package:graduation_project/core/colors/appColors.dart';

class InfoTextField extends StatelessWidget {
  String newtext  = '' ;
  String text;
  TextInputType? keyboardtype;

  Icon icon;
  TextEditingController controller;
  InfoTextField({


    Key? key,
    this.newtext = '',
    this.keyboardtype,
 
    required this.text,
    required this.icon,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
    
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
          color: AppColors.lightColor,
      ),
      margin: EdgeInsets.all(20),
      
      child: TextFormField(
        keyboardType: keyboardtype,

       
     
       
      
       controller: controller,
       
        
      
        
      
        style: TextStyle(
          
          color: AppColors.darkColor,
          fontSize: 20,
        ),
        cursorColor:AppColors.darkColor,
        decoration: InputDecoration(border: InputBorder.none,
        hintText:text,
        hintStyle:TextStyle(color: AppColors.darkColor,) ,
        prefixIcon: icon
        
        
        ),
        
      
        ),
      );
  }
}
