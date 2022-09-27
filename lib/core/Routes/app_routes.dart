import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:graduation_project/presentation/screens/health_info.dart';
import 'package:graduation_project/presentation/screens/homePage.dart';

class AppRoute{
  static String getInitial() => '/';
  static String getHealthInfo() => '/healthInfo';
  static List<GetPage> routes =[
   GetPage(name: getInitial(), page: ()=> HomePage()),
   GetPage(name:getHealthInfo() , page: ()=>HealthInfo())
  ];
}