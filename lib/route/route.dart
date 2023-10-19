import 'package:you_weather/features/view/view.dart';

final router = {
      '/' : (context) => const FavCitiesScreen(),
      '/city' :(context) => const CityScreen(),
      '/userWeather' : (context) => const CurrentUserWeatherScreen(),
};