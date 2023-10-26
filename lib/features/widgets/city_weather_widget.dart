import 'package:flutter/material.dart';
import 'package:you_weather/repositories/models/city_weather_models.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CityWeatherWidget extends StatelessWidget {
  const CityWeatherWidget({
    super.key,
    required this.cityWeather,
  });
  
  final CityWeather cityWeather;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/background/day.png"), 
            fit: BoxFit.cover
          ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          const TitleWeatherPage(title:"Weather details"),
          const NavBarRow(),
          MainParamsWeatherBlock(cityWeather: cityWeather),
          AdditionalParamsWeatherBlock(
            params: {
              "UV": cityWeather.getUVStatus(), 
              "Pressure": "${cityWeather.pressure} hPa", 
              "Wind speed": "${cityWeather.windSpeed} km/h"
            }
          ),
          AdditionalParamsWeatherBlock(
            params: {
              "Visibility": "${cityWeather.visibility} m" , 
              "Humidity": "${cityWeather.humidity} %", 
              "Feels like": "${cityWeather.feelsLike} C"
            }
          ),
        ],
      )
    );
  }
}


class NavBarRow extends StatelessWidget {
  const NavBarRow({super.key});

  @override
  Widget build(BuildContext context) {
    final ButtonStyle buttonTheme = ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.purple),
            foregroundColor: MaterialStateProperty.all(Colors.white),
            overlayColor:  MaterialStateProperty.all(Colors.purpleAccent),
            elevation: MaterialStateProperty.all(10),
          );
    return Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              ElevatedButton(
                onPressed: () {
                  // Кнопка нажата.
                },
                autofocus: true,
                //tooltip: const Text("Weather at the moment"),
                style: buttonTheme,
                child: const Text('Now'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Кнопка нажата.
                },
                style: buttonTheme,
                child: const Text('3 days'),
              ),
              ElevatedButton(
                onPressed: () {
                  // Кнопка нажата.
                },
                style: buttonTheme,
                child: const Text('7 days'),
              ),
      ],
    );
  }
}

class TitleWeatherPage extends StatelessWidget {
  const TitleWeatherPage({super.key, required this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      heightFactor: 2,
      child: Text(
        title, 
        style: theme.textTheme.labelLarge, 
      ),
    );
  }
}

class MainParamsWeatherBlock extends StatelessWidget {
  const MainParamsWeatherBlock({super.key,
  required this.cityWeather,
  });
  
  final CityWeather cityWeather;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          cityWeather.getClimateIconUrl(),
          height: 30,
          width: 30,
        ),
        Text(
          cityWeather.cityName, 
          style: theme.textTheme.bodyMedium, 
          textAlign: TextAlign.center,
        ),
        Text(
          "${cityWeather.weatherDescription} ${cityWeather.temperature} C", 
          style: theme.textTheme.labelSmall, 
          textAlign: TextAlign.center
        ),
      ],
    );
  }
}

class AdditionalParamsWeatherBlock extends StatelessWidget {
  const AdditionalParamsWeatherBlock({super.key,
  required this.params,
  });
  final Map<String, String> params;

  @override
  Widget build(BuildContext context) {
    return Container(
        color: const Color.fromARGB(176, 204, 229, 61),
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        height: 120,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: params.entries.map(
            (e) => AdditionalParamsWeatherItem(paramsName: e.key, paramsValue: e.value)).toList()
       ),
    );
  }
}

class AdditionalParamsWeatherItem extends StatelessWidget {
  const AdditionalParamsWeatherItem({super.key, 
    required this.paramsName, 
    required this.paramsValue
    });

  final String paramsName;
  final String paramsValue;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
      alignment: Alignment.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(paramsName),
          Text(paramsValue, style: theme.textTheme.labelMedium,),
        ]
      ),
    );
  }
}