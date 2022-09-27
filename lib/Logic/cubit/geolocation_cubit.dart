import 'dart:ffi';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:graduation_project/Logic/cubit/distanceBetween_function.dart';
part 'geolocation_state.dart';
class GeolocationCubit extends Cubit<GeolocationState>  {
  GeolocationCubit() : super(GeolocationInitial());
void getTheSecondNearestHospital()async{  
    Position position =   await Geolocator.getCurrentPosition();
   double rashid = Geolocator.distanceBetween(position.latitude, position.longitude,33.4999683 ,36.3022667);
    double almouwasat = Geolocator.distanceBetween(position.latitude, position.longitude,33.5054785,36.2827755);  
     double alassad = Geolocator.distanceBetween(position.latitude, position.longitude,33.5056445152703, 36.26963323672846);
      double alfyhaa = Geolocator.distanceBetween(position.latitude, position.longitude,33.49056073537452, 36.30046379120028);  
       double basil = Geolocator.distanceBetween(position.latitude, position.longitude,33.52665805126179, 36.23113172335824);
        double alsalam = Geolocator.distanceBetween(position.latitude, position.longitude,33.52008429704033, 36.26826646122981);   
         double radi = Geolocator.distanceBetween(position.latitude, position.longitude,33.4841586, 36.3498529);       
Map hospitalsPhoneNumbers ={'00963936552655':rashid,'00963112133018':almouwasat,'00963115625000':radi,'00963112126500':alassad,'00963118819596':alfyhaa,'00963113124250':basil,'00963113710640':alsalam,  };
Map hospitalsNames ={'rashid':rashid,'almouwasat':almouwasat,'radi':radi,'alassad':alassad,'alfyhaa':alfyhaa,'basil':basil,'alsalam':alsalam,  };
List hospitalsDistanceBetween = hospitalsPhoneNumbers.values.toList();
hospitalsDistanceBetween.sort();
List hospitalsnames = hospitalsNames.values.toList();
hospitalsnames.sort();
        hospitalsPhoneNumbers.forEach((number,distanceBetween ){
  
if(distanceBetween == hospitalsDistanceBetween[0]){
  hospitalsNames.forEach((name, value) { 
    if(value == hospitalsnames[0]){
     emit( 
   Geolocationloaded(distance: distanceBetween,phoneNumber: number,name: name ,myLat:position.latitude ,mylng: position.longitude));  }

  });

}}
);
  } 
}

 
// AlassadHospital , AlfyhaaHospital ,BasilHospital ,AlsalamHospital ,AlRadiHospital,RashidHospital,AlmouwasatHospital


// Rashid Hospital:
// Latitude: 33.4999683
// Longitude: 36.3022667
// Phone	:	+963 936 552 655
// Damascus Hospital:
//lat :33.499968,
//long:36.302267
// phone : 00963 0112216000
// al mouwasat :
// lat :33.5054785,36.2827755
// Al Radi Hospital :
// lat:33.4841586,
// long:36.3498529
