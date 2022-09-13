import 'dart:async';

import 'package:get/get.dart';
import 'package:weather_app/domain/weather/entities/index.dart';
import 'package:weather_app/domain/weather/repositories/index.dart';
import 'package:location/location.dart';

class WeatherController extends GetxController {
  final IWeatherRepository weatherRepository;

  WeatherDataEntity? data;
  double? lon;
  double? lat;

  bool loading = false;

  WeatherController({
    required this.weatherRepository,
    Object? screenArgs,
  }) {
    final args = screenArgs as Map<String, dynamic>?;
    if (args != null) {
      lon = args['lon'] as double;
      lat = args['lat'] as double;
    }
  }

  @override
  void onInit() async {
    if (lon == null && lat == null) {
      await _getLocation();
    }

    await getCurrentWeather();
    super.onInit();
  }

  Future<void> _getLocation() async {
    Location _location = Location();

    bool _serviceEnabled;
    PermissionStatus _permissionGranted;
    LocationData _locationData;

    _serviceEnabled = await _location.serviceEnabled();
    if (!_serviceEnabled) {
      _serviceEnabled = await _location.requestService();
      if (!_serviceEnabled) {
        return;
      }
    }

    _permissionGranted = await _location.hasPermission();
    if (_permissionGranted == PermissionStatus.denied) {
      _permissionGranted = await _location.requestPermission();
      if (_permissionGranted != PermissionStatus.granted) {
        return;
      }
    }

    _locationData = await _location.getLocation();
    lon = _locationData.longitude;
    lat = _locationData.latitude;
  }

  Future<void> getCurrentWeather() async {
    loading = true;
    update();
    final result = await weatherRepository.getCurrentWeather(
        coord: CoordEntity(lon: lon!, lat: lat!));
    result.fold((l) => null, (r) {
      data = r;
      loading = false;
      update();
    });
  }
}
