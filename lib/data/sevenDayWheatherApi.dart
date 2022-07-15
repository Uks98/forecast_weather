import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:wheather_forecast/model/sevenDayWheather.dart';
import 'package:wheather_forecast/model/weather_model.dart';


class SevenDayApi {
  var tempList;
  var body;
  Future<List<SevenDayWeather>> getSevenWeather() async {
    double lat = 35.3112800;
    double lon = 128.9883630;
    const key = "f8e0ef6ecfae20df7685a3ae105ba738";
    final url = "https://api.openweathermap.org/data/2.5/onecall?lat=$lat&lon=-$lon&exclude=current,hourly,minutely&appid=$key&units=metric&lang=kr";
    final response = await http.get(Uri.parse(url));

    //print(utf8.decode(response.bodyBytes));

    List<SevenDayWeather> sevenDayDataList = [];
    if (response.statusCode == 200) {
      body = jsonDecode(response.body);
      for (int i = 0; i < 8 ; i++) {
        tempList = body["daily"][i];
        final temps = SevenDayWeather(
            max:tempList["temp"]["max"].round(),
            min:tempList["temp"]["min"].round(),
            id:tempList["weather"][0]["id"],
            description:tempList["weather"][0]["description"],
            icon: tempList["weather"][0]["icon"]);
        sevenDayDataList.add(temps);
        print(sevenDayDataList);
      }
      return sevenDayDataList;

    }
    throw Exception("ㅇㅁㅇㅁ");
  }
}