import 'dart:ffi';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:wheather_forecast/data/api.dart';
import 'package:wheather_forecast/data/sevenDayWheatherApi.dart';
import 'package:wheather_forecast/page/sevenDayInfo.dart';

import '../model/sevenDayWheather.dart';
import '../model/weather_model.dart';

class WeatherForecastPage extends StatefulWidget {
  const WeatherForecastPage({Key? key}) : super(key: key);

  @override
  State<WeatherForecastPage> createState() => _WeatherForecastPageState();
}

class _WeatherForecastPageState extends State<WeatherForecastPage> {
  List<WeatherForecast> data = [];
  List<WeatherForecast> chartData = [];


  final forecastApi = Api();

  double? chartWhether;
  Api api = Api();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getTodayWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 10,
          ),
          TextButton(onPressed: ()=>nextToInfoPage(context), child: const Text("주간 날씨")),
          const SizedBox(
            height: 1,
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: LineChart(
                LineChartData(
                  backgroundColor: Colors.white,
                  minX: 0,
                  maxX: 14,
                  maxY: 40,
                  minY: 0,
                  lineBarsData: [
                    LineChartBarData(
                      spots: [
                        FlSpot(0, api.chart1 ?? 15.0),
                        FlSpot(2, api.chart2 ?? 15.0),
                        FlSpot(4, api.chart3 ?? 15.0),
                        FlSpot(6, api.chart4 ?? 15.0),
                        FlSpot(8, api.chart5 ?? 15.0),
                        FlSpot(10, api.chart6 ?? 15.0),
                        FlSpot(12, api.chart7 ?? 15.0),
                        FlSpot(14, api.chart8 ?? 15.0),
                      ],
                      isCurved: false,
                      barWidth: 5,
                      belowBarData: BarAreaData(
                        show: true,
                      )
                    )
                  ],
                  gridData: FlGridData(
                    show: true,
                    drawVerticalLine: false
                  ),
                  borderData: FlBorderData(
                    show: true,
                    border: Border.all(color: const Color(0xff37434d), width: 1),
                  ),titlesData: FlTitlesData(
                  show: true,
                  topTitles: SideTitles(showTitles: false),
                  rightTitles: SideTitles(showTitles: false),
                  bottomTitles: SideTitles(
                    showTitles: true,
                    reservedSize: 22,
                    getTitles: (value) {
                      getChartBottomTime(value.toInt());
                      return '';
                    },
                    margin: 8,
                  ),
                  leftTitles: SideTitles(
                    showTitles: true,
                    getTitles: (value) {
                      switch (value.toInt()) {
                        case 10:
                          return '10';
                        case 20:
                          return '30';
                        case 30:
                          return '50';
                      }
                      return '';
                    },
                    reservedSize: 28,
                    margin: 12,
                  ),
                ),
                  )
                ),
            ),
            ),
        ],
      ),
    );
  }

  void getTodayWeather() async {
    data = await api.getWeatherForecast();
    setState(() {});
  }
  Future<void> nextToInfoPage(BuildContext context){
    return Navigator.of(context).push(MaterialPageRoute(builder: (context)=>SevenDayInfo()));
  }
  String getChartBottomTime(int valueInt){
    switch (valueInt) {
      case 0:
        return '0시';
      case 2:
        return '3시';
      case 4:
        return '6시';
      case 6:
        return '9시';
      case 8:
        return '12시';
      case 10:
        return '15시';
      case 12:
        return '18시';
      case 14:
        return '21시';
    }
    return "";
  }
  Widget weatherCard(){
    return Container(
      width: 300,
      height: 200,
      child: Column(
        children: [],
      ),
    );
  }
}
