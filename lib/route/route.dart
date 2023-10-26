import 'package:you_weather/features/view/city_screen.dart';
import 'package:you_weather/features/view/current_user_weather_screen.dart';
import 'package:you_weather/features/view/fav_cities_screen.dart';


final router = {
      '/' : (context) => const FavCitiesScreen(),
      '/city' :(context) => const CityScreen(),
      '/userWeather' : (context) => const CurrentUserWeatherScreen(),
};