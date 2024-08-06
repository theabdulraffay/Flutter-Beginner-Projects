import 'package:climate_app/services/networking.dart';
import 'package:climate_app/services/location.dart';

const apiKey = '3f1f94e18f3c4525ae395237240608';

class WeatherModel {
  Future<dynamic> getCityWeather(String cityName) async {
    String newApi =
        'http://api.weatherapi.com/v1/current.json?key=$apiKey&q=$cityName';
    GeoLocation location = GeoLocation();
    await location.getCurrentLocation();
    // print(location.latitude);
    // print(location.longitude);
    Networking network = Networking(newApi);
    var weatherData = await network.getData();
    return weatherData;
  }

  Future<dynamic> getLocationWeather() async {
    GeoLocation location = GeoLocation();
    await location.getCurrentLocation();
    // print(location.latitude);
    // print(location.longitude);
    Networking network = Networking(
        'https://api.weatherapi.com/v1/current.json?key=$apiKey&q=${location.latitude},${location.longitude}');
    var weatherData = await network
        .getData(); // The map of the fetched data that arrived from the server
    return weatherData;
  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  static String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
