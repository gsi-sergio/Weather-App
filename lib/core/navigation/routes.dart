class Routes {
  static Future<String> get getInitialRoute async {
    return SPLASH;
  }

  static const String SPLASH = '/splash';
  static const String WEATHER = '/weather';
  static const String SEARCH_PLACE = '/search_place';
}
