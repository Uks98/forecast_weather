import 'package:flutter/material.dart';
import 'package:wheather_forecast/model/sevenDayWheather.dart';

import '../data/sevenDayWheatherApi.dart';


class SevenDayInfo extends StatefulWidget {
   SevenDayInfo({Key? key}) : super(key: key);
  @override
  State<SevenDayInfo> createState() => _SevenDayInfoState();
}

class _SevenDayInfoState extends State<SevenDayInfo> {
  List<SevenDayWeather> sevenData = [];
  final sevenWeather = SevenDayApi();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getSevenDayWeather();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("sds"),),
      body: Column(
        children: [
          Expanded(
            child: sevenData.isEmpty ? Center(child: CircularProgressIndicator()):ListView.builder(
              // scrollDirection: Axis.horizontal,
                itemCount: sevenData.length,
                itemBuilder: (ctx, idx) {
                  final forecastList = sevenData[idx];
                  return Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(forecastList.id.toString()),
                        Text(forecastList.description.toString()),
                        Text(forecastList.max.toString()),
                        Text(forecastList.min.toString()),
                      ],
                    ),
                  );
                }),
          ),
        ],
      )
    );
  }
  void getSevenDayWeather() async {
    sevenData = await sevenWeather.getSevenWeather();
    setState(() {});
  }
}
