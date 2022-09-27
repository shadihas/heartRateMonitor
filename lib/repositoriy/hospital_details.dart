import 'package:equatable/equatable.dart';

class Hospital extends Equatable{

  final double latitude;
  final double longitude;
  final double phoneNumber;

  Hospital({required this.latitude,required this.longitude,required this.phoneNumber});


static List<Hospital> hospital=[
 

];
  @override
 
  List<Object?> get props => [latitude,longitude,phoneNumber];

}