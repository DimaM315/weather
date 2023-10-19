
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:you_weather/repositories/models/models.dart';

class CityTile extends StatelessWidget {
  const CityTile({
    super.key,
    required this.city,
  });
  
  final City city;

  @override
  Widget build(BuildContext context) {
    CityWeather currentCityWeather = city.cityWeatherList[0];
    final theme = Theme.of(context);
    
    return ListTile(
      leading: SizedBox(
        width: 100,
        child: SvgPicture.asset(
          currentCityWeather.getClimateIconUrl(),
          width: 40,
          height: 40,
        ),
      ),
      trailing: const Icon(
        Icons.arrow_forward_ios, 
        color: Colors.white,
      ),
      onTap: () {
        Navigator.of(context).pushNamed('/city', arguments: city);
      },
      title: Text(
        city.name, 
        style: theme.textTheme.bodyMedium, 
      ),
      subtitle: Text(
        currentCityWeather.weatherDescription, 
        style: theme.textTheme.labelSmall,
      ),
    );
  }
}