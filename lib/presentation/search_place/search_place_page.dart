import 'package:flutter/material.dart';
import 'package:google_api_headers/google_api_headers.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:weather_app/core/navigation/index.dart';
import 'package:weather_app/core/tools/index.dart';
import 'package:weather_app/infrastructure/core/rest_api/constants.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:get/get.dart';

class SearchPlacePage extends PlacesAutocompleteWidget {
  SearchPlacePage()
      : super(
          apiKey: GOOGLE_MAPS_API_KEY,
          sessionToken: Uuid().generateV4(),
          language: "en",
          components: [],
          types: [],
          strictbounds: false,
        );

  @override
  _SearchPlacePageState createState() => _SearchPlacePageState();
}

class _SearchPlacePageState extends PlacesAutocompleteState {
  final searchScaffoldKey = GlobalKey<ScaffoldState>();

  Future<void> displayPrediction(Prediction? p, BuildContext context) async {
  if (p != null) {
    // get detail (lat/lng)
    GoogleMapsPlaces _places = GoogleMapsPlaces(
      apiKey: GOOGLE_MAPS_API_KEY,
      apiHeaders: await const GoogleApiHeaders().getHeaders(),
    );
    PlacesDetailsResponse detail =
        await _places.getDetailsByPlaceId(p.placeId!);
    final lat = detail.result.geometry!.location.lat;
    final lng = detail.result.geometry!.location.lng;

    Get.offNamed(Routes.WEATHER, arguments: {'lon': lng, 'lat': lat});   
  }
}

  @override
  Widget build(BuildContext context) {
    final appBar = AppBar(title: AppBarPlacesAutoCompleteTextField());
    final body = PlacesAutocompleteResult(
      onTap: (p) {
        displayPrediction(p, context);
      },
      logo: Row(
        children: const [],
        mainAxisAlignment: MainAxisAlignment.center,
      ),
    );
    return Scaffold(key: searchScaffoldKey, appBar: appBar, body: body);
  }

  @override
  void onResponseError(PlacesAutocompleteResponse response) {
    super.onResponseError(response);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(response.errorMessage!)),
    );
  }
}