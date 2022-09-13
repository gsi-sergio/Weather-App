import 'package:flutter/material.dart';
import 'package:weather_app/domain/weather/entities/index.dart';
import 'package:sizing/sizing.dart';

class WeatherCard extends StatelessWidget{
  final WeatherEntity weather;

  const WeatherCard({Key? key,required this.weather}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(5.ss),
      child: Card(
        color: Colors.grey[200],
        child: Container(
          margin: EdgeInsets.all(20.ss),
          child: Column(
            children: [
              // weather.icon != null ? Image.network(weather.icon!,height: 30.ss,) : Icon(Icons.sunny_snowing, size: 30.ss,),
              Text(weather.main, style: TextStyle(fontSize: 18.fs, fontWeight: FontWeight.bold),),
              Row(children: [Text(weather.description)],),
              ],
          ),
        ),
      ),
    );
  }

}