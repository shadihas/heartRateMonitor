import 'package:geolocator/geolocator.dart';

class BaseGeolocationRepository {
  Future<LocationPermission?> determinePosition() async {}
  
}