import 'dart:async';


import 'package:geolocator/geolocator.dart';
import 'package:graduation_project/repositoriy/base_geolocation_repository.dart';

class GeolocationRepository extends BaseGeolocationRepository{

 Future<LocationPermission?> determinePosition() async {
  bool serviceEnabled;
  LocationPermission permission;

  
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
  if (!serviceEnabled) {
   
  

  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
    
      return Future.error('Location permissions are denied');
    }
  }
 
    if (permission == LocationPermission.deniedForever){
 try {
   permission = await Geolocator.checkPermission();
   
 } catch (e) {
   print(e);
  }
  
    }
    
  
   
   
 

 
  return permission;
 }}}