
class SevenDayWeather{
    final int max;
    final int min;
    final int id;
    final String icon;
    final String description;

    SevenDayWeather({required this.max, required this.min, required this.id, required this.icon,required this.description});


    @override
  String toString() {
    // TODO: implement toString
    "최고온도${max}";
    return super.toString();
  }
}