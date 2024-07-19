
import 'dart:convert';
import 'package:corona_app/Services/Utilities/app_url.dart';
import 'package:http/http.dart' as http;
import '../../Model/CountryStatsModel.dart';
import '../../Model/WorldStatsModel.dart';

class StatesServies {
  static Future<WorldStatsModel> getAllData() async {
    final response = await http.
    get(Uri.parse(AppUrl.allData)); // Uri = Uniform resource identifier
    var data = jsonDecode(response.body);
    return WorldStatsModel.fromJson(data);
  }

static List<CountryStatsModel> country = [];
  static Future<List<dynamic>> getCountryData() async {
    final response = await http.
    get(Uri.parse(AppUrl.countriesData)); // Uri = Uniform resource identifier
    var data = jsonDecode(response.body);
    if(response.statusCode == 200) {
      for(Map i in data) {
        country.add(CountryStatsModel.fromJson(i));
      }
    }
    return data;
  }
}