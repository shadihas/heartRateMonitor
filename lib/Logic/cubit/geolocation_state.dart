part of 'geolocation_cubit.dart';

abstract class GeolocationState extends Equatable {
  const GeolocationState();

  @override
  List<Object> get props => [];
}
class GeolocationInitial extends GeolocationState {}

class Geolocationloaded extends GeolocationState {
 
 
final double distance ;
 final String phoneNumber;
 final String name;
 final double myLat;
 final double mylng;
  Geolocationloaded({
    required this.name,
    required this.distance,
    required this.phoneNumber,
    required this.myLat,
    required this.mylng
   
  });
  
   @override
  List<Object> get props => [phoneNumber,distance,name];
}
