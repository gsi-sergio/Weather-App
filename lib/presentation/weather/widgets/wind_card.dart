import 'package:flutter/material.dart';
import 'package:weather_app/domain/weather/entities/index.dart';
import 'package:sizing/sizing.dart';

class WindCard extends StatelessWidget {
  final WindEntity wind;

  const WindCard({Key? key, required this.wind}) : super(key: key);

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
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Wind',
                    style:
                        TextStyle(fontSize: 18.fs, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(height: 10.ss,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'speed: ',
                        style: TextStyle(
                            fontSize: 16.fs, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${wind.speed} m/s',
                        style: TextStyle(fontSize: 16.fs),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'direction: ',
                        style: TextStyle(
                            fontSize: 16.fs, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${wind.degrees} °',
                        style: TextStyle(fontSize: 16.fs),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
