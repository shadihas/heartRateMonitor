 import 'package:geolocator/geolocator.dart';
 
 class  GetTheNearestHospital{
   void getTheSecondNearestHospital()async{
    
    Position position =   await Geolocator.getCurrentPosition();
  // 00963936552655
   double rashid = Geolocator.distanceBetween(position.latitude, position.longitude,33.4999683 ,36.3022667);
  // 00963112133018 
    double almouwasat = Geolocator.distanceBetween(position.latitude, position.longitude,33.5054785,36.2827755);
    // 	00963112126500
     double alassad = Geolocator.distanceBetween(position.latitude, position.longitude,33.5056445152703, 36.26963323672846);
    //  	00963118819596
      double alfyhaa = Geolocator.distanceBetween(position.latitude, position.longitude,33.49056073537452, 36.30046379120028);
      // 	00963113124250
       double basil = Geolocator.distanceBetween(position.latitude, position.longitude,33.52665805126179, 36.23113172335824);
      //  	00963113710640
        double alsalam = Geolocator.distanceBetween(position.latitude, position.longitude,33.52008429704033, 36.26826646122981);
        // 00963115625000
         double radi = Geolocator.distanceBetween(position.latitude, position.longitude,33.4841586, 36.3498529);
         

Map hospitalsPhoneNumber ={'00963936552655':rashid,'00963112133018':almouwasat,'00963115625000':radi,'00963112126500':alassad,'00963118819596':alfyhaa,'00963113124250':basil,'00963113710640':alsalam,  };

List hospitalsDistanceBetween = hospitalsPhoneNumber.values.toList();
hospitalsDistanceBetween.sort();
print(hospitalsDistanceBetween[0]);


hospitalsPhoneNumber.forEach((number,distanceBetween ){

if(distanceBetween == hospitalsDistanceBetween[1]){
  
  print(number);
 
}
}
);
  }
  
}


 

