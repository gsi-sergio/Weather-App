import 'package:flutter/material.dart';
import 'package:weather_app/domain/weather/entities/index.dart';
import 'package:sizing/sizing.dart';

class CloudsCard extends StatelessWidget {
  final CloudsEntity clouds;

  const CloudsCard({Key? key, required this.clouds}) : super(key: key);

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
                    Icons.cloud,
                    size: 20.ss,
                  ),
                  SizedBox(
                    width: 5.ss,
                  ),
                  Text(
                    'Clouds',
                    style:
                        TextStyle(fontSize: 18.fs, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              SizedBox(
                height: 10.ss,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    'cloudiness: ',
                    style:
                        TextStyle(fontSize: 16.fs, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    '${clouds.all} %',
                    style: TextStyle(fontSize: 16.fs),
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
