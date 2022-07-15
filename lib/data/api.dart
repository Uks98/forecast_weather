import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:wheather_forecast/model/weather_model.dart';


class Api {
     var tempList;
     var body;
     double? chart1; //00시
     double? chart2; //03시
     double? chart3; //06시
     double? chart4; //09시
     double? chart5; //12시
     double? chart6; //15시
     double? chart7; //18시
     double? chart8; //21시
  Future<List<WeatherForecast>> getWeatherForecast() async {
    double lat = 35.3112800;
    double lon = 128.9883630;
    const key = "b0693b032a0f9043662de8e6fc9de5e8";
    final url = "https://api.openweathermap.org/data/2.5/forecast?lat=$lat&lon=$lon&appid=$key&units=metric";
    final response = await http.get(Uri.parse(url));

    //print(utf8.decode(response.bodyBytes));

    List<WeatherForecast> data = [];
    if (response.statusCode == 200) {
         body = jsonDecode(response.body);
      for (var i = 0; i < 7; i++) {
           tempList = body["list"][i]["main"];
        final temp = WeatherForecast(
            temp: tempList["temp"].round(),
            tempMin: tempList["temp_min"].round(),
           // forecastDay: tempList["temp_kf"]
        );
        data.add(temp);
      }
      chart1 = body["list"][0]["main"]["temp"];
      chart2 = body["list"][1]["main"]["temp"];
      chart3 = body["list"][2]["main"]["temp"];
      chart4 = body["list"][3]["main"]["temp"];
      chart5 = body["list"][4]["main"]["temp"];
      chart6 = body["list"][5]["main"]["temp"];
      chart7 = body["list"][6]["main"]["temp"];
      chart8 = body["list"][7]["main"]["temp"];
      return data;
    }
    throw Exception("ㅇㅁㅇㅁ");
  }
}