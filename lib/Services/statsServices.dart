import 'dart:convert';

import 'package:http/http.dart' as http;
import '../Services/Utalities/app_urls.dart';

import '../Model/worldStatsModel.dart';

class StatsServices {
  Future<WorldStatsModel> fetchworldstat() async {
    final response = await http.get(Uri.parse(appUrls.worldStat));
    if (response.statusCode == 200) {
      var data = jsonDecode(response.body);
      return WorldStatsModel.fromJson(data);
    } else {
      throw Exception('Error');
    }
  }

  Future<List<dynamic>> countrStats() async {
    var data;
    final response = await http.get(Uri.parse(appUrls.countryWise));
    if (response.statusCode == 200) {
      data = jsonDecode(response.body);
      return data;
    } else {
      throw Exception('Error');
    }
  }
}
