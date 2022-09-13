import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:weather_app/application/weather/index.dart';
import 'package:weather_app/core/navigation/index.dart';
import 'package:weather_app/presentation/weather/widgets/index.dart';

class WeatherPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<WeatherController>(builder: (_) {
      return Scaffold(
        appBar: AppBar(
            title: Text(_.loading
                ? 'Getting data...'
                : _.data?.cityName ?? 'Search places...'),
            actions: [
              IconButton(
                  onPressed: () => Get.offNamed(Routes.SEARCH_PLACE),
                  icon: const Icon(Icons.search))
            ]),
        body: _.loading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : _.data == null
                ? Container()
                : Column(mainAxisAlignment: MainAxisAlignment.start, children: [
                    WeatherCard(weather: _.data!.weather[0]),
                    TemperatureCard(parameters: _.data!.main,),
                    WindCard(wind: _.data!.wind,),
                    CloudsCard(clouds: _.data!.clouds),
                  ]),
      );
    });
  }
}
