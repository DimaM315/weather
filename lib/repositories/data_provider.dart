import 'package:geolocator/geolocator.dart';
import 'package:dio/dio.dart';

class DataProvider {
  final Dio dio = Dio();

  Future<Map<String, double>> getCurrentUserPosition() async {
    Position newPosition = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high
    ).timeout(new Duration(seconds: 5));
    return {"lon": newPosition.longitude, "lat": newPosition.latitude};
  }

  Future<Map<String, dynamic>> getRawWeatherData(double lat, double lon) async {
    final responce = await dio.get(
      "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=$lon&exclude=minutely,alerts&appid=ad31d354599c92d3653b5a1482d777ea&units=metric"
    );
    final data = responce.data as Map<String, dynamic>;
    return data;
  }

}