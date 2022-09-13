import 'package:flutter/material.dart';
import 'package:weather_app/domain/weather/entities/index.dart';
import 'package:sizing/sizing.dart';

class TemperatureCard extends StatelessWidget {
  final MainParametersEntity parameters;

  const TemperatureCard({Key? key, required this.parameters}) : super(key: key);

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
                  Icon(
                    Icons.thermostat_rounded,
                    size: 20.ss,
                  ),
                  SizedBox(
                    width: 5.ss,
                  ),
                  Text(
                    'Temperature: ',
                    style:
                        TextStyle(fontSize: 18.fs, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${parameters.temp} °C',
                    style: TextStyle(fontSize: 18.fs),
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
                        'min: ',
                        style: TextStyle(
                            fontSize: 16.fs, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${parameters.tempMin} °C',
                        style: TextStyle(fontSize: 16.fs),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'max: ',
                        style: TextStyle(
                            fontSize: 16.fs, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${parameters.tempMax} °C',
                        style: TextStyle(fontSize: 16.fs),
                      ),
                    ],
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
                        'humidity: ',
                        style: TextStyle(
                            fontSize: 16.fs, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${parameters.humidity} %',
                        style: TextStyle(fontSize: 16.fs),
                      ),
                    ],
                  ),

                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        'pressure: ',
                        style: TextStyle(
                            fontSize: 16.fs, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        '${parameters.pressure} hPa',
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
