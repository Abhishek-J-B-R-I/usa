import 'package:flutter/material.dart';
import 'package:weather_forecast_and_current_location/screens/Loading_Screen.dart';
import 'package:weather_forecast_and_current_location/screens/city_screen.dart';
void main(){
  runApp(myWeather());
}
class myWeather extends StatelessWidget {
  const myWeather({super.key});

  @override
  Widget build(BuildContext context) {
    return
      MaterialApp(

       theme: ThemeData.dark(),
        home: City_screen(),
        debugShowCheckedModeBanner: false,
      );
  }
}
