import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';

class DataProvider {
  final Dio dio = Dio();
  Position? _userPosition;

  Future<Position> getCurrentUserPosition() async {
    if (_userPosition != null) return _userPosition!;

    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }
    if (permission == LocationPermission.deniedForever) {
      return Future.error(
        'Location permissions are permanently denied, we cannot request permissions.');
    } 
    _userPosition = await Geolocator.getCurrentPosition().timeout(const Duration(seconds: 5));

    debugPrint("\n\n\n\n getCurrentUserPosition() $_userPosition \n\n\n\n");
    return _userPosition!;
  }

  Future<Map<String, dynamic>> getRawWeatherData(double lat, double lon) async {
    final responce = await dio.get(
      "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,alerts&appid=ad31d354599c92d3653b5a1482d777ea&units=metric"
    );
    debugPrint("getRawWeatherData() request for lat:$lat lon:$lon");
    final data = responce.data as Map<String, dynamic>;
    return data;
  }
}