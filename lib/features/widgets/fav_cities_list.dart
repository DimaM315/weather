import 'package:flutter/material.dart';
import 'package:you_weather/features/widgets/city_tile.dart';
import 'package:you_weather/repositories/models/city_models.dart';

class FavCitiesList extends StatelessWidget {
  const FavCitiesList({
    super.key,
    required List<City>? cityList,
  }) : _cityList = cityList;

  final List<City>? _cityList;

  @override
  Widget build(BuildContext context) {
    return DecoratedBox(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: AssetImage("assets/background/day.png"), 
            fit: BoxFit.cover
          ),
      ),
      child:ListView.separated(
        padding: const EdgeInsets.only(top:15, left: 35, right: 35),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: _cityList == null ? 0 : _cityList!.length,
        itemBuilder: (context, index) {
          return CityTile(
            city: _cityList![index]
          );     
        },
      )
    );
  }
}